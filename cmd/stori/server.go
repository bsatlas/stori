// Copyright © 2018 Atlas Kerr atlaskerr@gmail.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"context"
	"crypto/tls"
	"fmt"
	"net"
	"net/http"
	"os"
	"os/signal"
	"syscall"

	"github.com/atlaskerr/stori/cmd/stori/server"
	storihttp "github.com/atlaskerr/stori/http"
	"github.com/atlaskerr/stori/stori"

	"github.com/mitchellh/colorstring"
	"github.com/spf13/cobra"
	"go.uber.org/zap"
)

var serverCmd = &cobra.Command{
	Use:   "server",
	Short: "Start the Stori registry server.",
	Run:   startServer,
}

func startServer(cmd *cobra.Command, args []string) {
	devMode, _ := cmd.Flags().GetBool("dev")
	if devMode {
		colorstring.Println("[light_yellow][bold]Starting Stori Registry in development mode")
	}

	// initialize the logger
	logger := func() *zap.Logger {
		if devMode {
			return server.Logger("debug", true)
		}
		logLevel := cmd.Flag("log-level").Value.String()
		return server.Logger(logLevel, false)
	}()

	// initialize server config
	c := func() *server.Config {
		if devMode {
			return server.DevConfig
		}
		configPath := cmd.Flag("config").Value.String()
		srvConf, err := server.LoadConfigFile(configPath)
		if err != nil {
			fmt.Printf("unable to load config file: %v", err)
		}
		return srvConf
	}()

	// registry configuration
	registryConf := func() *stori.RegistryConfig {
		if devMode {
			return &stori.RegistryConfig{
				Logger: logger,
			}
		}
		return &stori.RegistryConfig{
			Logger: logger,
		}
	}()

	// initialize the registry and handlers
	registry, _ := stori.NewRegistry(registryConf)
	handler := storihttp.Handler(&stori.HandlerProperties{
		Registry: registry,
	})

	// start listener
	addr := c.Server.Address
	tlsEnabled := c.Server.TLS.Enabled
	ln := func() net.Listener {
		if devMode || !tlsEnabled {
			listener, err := net.Listen("tcp", addr)
			if err != nil {
				fmt.Printf("unable to start listener address %v: %v\n", addr, err)
			}
			return listener
		}
		certFile := c.Server.TLS.CertFile
		keyFile := c.Server.TLS.KeyFile
		cert, err := tls.LoadX509KeyPair(certFile, keyFile)
		if err != nil {
			fmt.Printf("unable to load server certificates: %v\n", err)
		}
		tlsConfig := &tls.Config{
			Certificates: []tls.Certificate{cert},
		}
		listener, err := tls.Listen("tcp", addr, tlsConfig)
		if err != nil {
			fmt.Printf("unable to start listener address %v: %v\n", addr, err)
		}
		return listener
	}()

	// initialize HTTP server
	srv := http.Server{
		Handler: handler,
	}

	// start server
	go srv.Serve(ln)
	colorstring.Printf("[bold]Server listening on: %v\n", addr)

	// Wait for a signal to stop the server.
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGINT)
	for {
		select {
		case sig := <-sigs:
			if sig == syscall.SIGINT {
				colorstring.Printf("\n[light_yellow][bold]SIGINT received: Initiating graceful shutdown.\n")
				srv.Shutdown(context.Background())
				colorstring.Println("[light_green][bold]Shudown complete.")
				os.Exit(0)
			}
		}
	}
}

func init() {
	rootCmd.AddCommand(serverCmd)

	serverCmd.Flags().StringP(
		"config",
		"c",
		"/etc/stori/config.json",
		"Path to config file.",
	)

	serverCmd.Flags().StringP(
		"log-level",
		"l",
		"info",
		"Set the server's log level.",
	)

	serverCmd.Flags().Bool(
		"dev",
		false,
		"Start server in development mode.",
	)
}
