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

package http

import (
	"fmt"
	"net"
	"net/http"
	"testing"

	"github.com/atlaskerr/stori/stori"
)

// TestServer returns a stori registry server.
func TestServer(tb testing.TB, reg *stori.Registry) (net.Listener, string) {
	ln, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		tb.Fatalf("failed to start listener: %v", err)
	}
	addr := ln.Addr().String()

	props := &stori.HandlerProperties{
		Registry: reg,
	}

	srv := &http.Server{
		Addr:    addr,
		Handler: Handler(props),
	}
	go srv.Serve(ln)

	return ln, fmt.Sprintf("http://%s", addr)
}
