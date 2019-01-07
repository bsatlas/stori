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
	"fmt"

	"github.com/spf13/cobra"
)

var (
	// Version is the semanitic version of the binary.
	Version = "undefined"

	// Commit is the target commit SHA of the binary.
	Commit = "undefined"
)

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print version information for Stori",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Printf("stori version: %v\n", Version)
		fmt.Printf("commit: %v\n", Commit)
	},
}

func init() {
	rootCmd.AddCommand(versionCmd)
}
