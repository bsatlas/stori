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
	"net"
	"net/http"
	"os"
	"os/signal"
	"syscall"

	"github.com/atlaskerr/stori/cmd/stori/server"
	storihttp "github.com/atlaskerr/stori/http"
	"github.com/atlaskerr/stori/stori"

	"github.com/spf13/cobra"
	"go.uber.org/zap"
)

var serverCmd = &cobra.Command{
	Use:   "server",
	Short: "Start the Stori registry server.",
	Run:   startServer,
}

func startServer(cmd *cobra.Command, args []string) {
	configFile := cmd.Flag("config").Value.String()
	logLevel := cmd.Flag("log-level").Value.String()
	devMode, _ := cmd.Flags().GetBool("dev")

	// Set the logger first.
	logger, _ := server.NewLogger(logLevel, devMode)
	defer logger.Sync()

	// Load the config file.
	logger.Debug("Loading config file...")
	conf, err := server.LoadConfigFile(configFile)
	if err != nil {
		logger.Error("Failed to read file.",
			zap.String("file", configFile),
			zap.Error(err),
		)
	}
	logger.Debug("Configuration file loaded successfully.")

	registryConfig := &stori.RegistryConfig{
		Logger: logger,
	}

	// Initialize the Registry
	registry, _ := stori.NewRegistry(registryConfig)

	handler := storihttp.Handler(&stori.HandlerProperties{
		Registry: registry,
	})

	server := &http.Server{
		Addr:    conf.Server.Address,
		Handler: handler,
	}

	listener := func() net.Listener {
		if conf.Server.TLS.Enabled {
			cert, err := tls.LoadX509KeyPair(
				conf.Server.TLS.CertFile,
				conf.Server.TLS.KeyFile,
			)
			if err != nil {
				logger.Error("Unable to load server certificates.", zap.Error(err))
			}

			tlsConfig := &tls.Config{
				Certificates: []tls.Certificate{cert},
			}
			l, err := tls.Listen("tcp", conf.Server.Address, tlsConfig)
			return l
		}
		l, err := net.Listen("tcp", conf.Server.Address)
		if err != nil {
			logger.Error(
				"Failed to start listener",
				zap.String("address", conf.Server.Address),
				zap.Error(err),
			)
		}
		return l
	}()

	go server.Serve(listener)
	logger.Info(
		"Server started sucessfully.",
		zap.String("address", conf.Server.Address),
	)

	// Wait for a signal to stop the server.
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGINT)
	for {
		select {
		case sig := <-sigs:
			if sig == syscall.SIGINT {
				logger.Info("SIGINT received: Initiating graceful shutdown.")
				server.Shutdown(context.Background())
				logger.Info("Shudown complete.")
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
