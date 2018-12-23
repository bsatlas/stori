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

package cmd

import (
	"github.com/atlaskerr/stori/cmd/server"

	"github.com/spf13/cobra"
)

var serverCmd = &cobra.Command{
	Use:   "server",
	Short: "Start the Stori registry server.",
	Run: func(cmd *cobra.Command, args []string) {
		//		configFile := cmd.Flag("config").Value.String()
		logLevel := cmd.Flag("log-level").Value.String()
		devMode, _ := cmd.Flags().GetBool("dev")

		logger, _ := server.NewLogger(logLevel, devMode)
		logger.Info("Logger construction succeeded.")

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
