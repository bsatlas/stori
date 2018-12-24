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
	"net/http"

	"github.com/atlaskerr/stori/cmd/stori/server"
	storihttp "github.com/atlaskerr/stori/http"
	"github.com/atlaskerr/stori/registry"

	"github.com/spf13/cobra"
	"go.uber.org/zap"
)

var serverCmd = &cobra.Command{
	Use:   "server",
	Short: "Start the Stori registry server.",
	Run: func(cmd *cobra.Command, args []string) {
		configFile := cmd.Flag("config").Value.String()
		logLevel := cmd.Flag("log-level").Value.String()
		devMode, _ := cmd.Flags().GetBool("dev")

		// Set the logger first.
		logger, _ := server.NewLogger(logLevel, devMode)

		// Load the config file.
		logger.Debug("Loading config file...")
		_, err := server.LoadConfigFile(configFile)
		if err != nil {
			logger.Error("Failed to read file.",
				zap.String("file", configFile),
				zap.Error(err),
			)
		}
		logger.Debug("Configuration file loaded successfully.")

		registryConfig := &registry.Config{}

		// Initialize the Registry
		registry := registry.New(registryConfig)

		handler := storihttp.Handler(&registry.HandlerProperties{
			Registry: registry,
		})

		server := &http.Server{}
	},
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
