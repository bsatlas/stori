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

package plugin

import (
	"net/rpc"

	"github.com/atlaskerr/stori/authn"
	"github.com/hashicorp/go-plugin"
)

// TokenAuthenticatorPlugin implements plugin.Plugin.
type TokenAuthenticatorPlugin struct {
	TokenAuthenticator func() authn.TokenAuthenticator
}

// Server returns an authn.TokenAuthenticator that communicates via RPC.
func (a *TokenAuthenticatorPlugin) Server(broker *plugin.MuxBroker,
) (interface{}, error) {
	t := &TokenAuthenticatorServer{
		Broker:             broker,
		TokenAuthenticator: a.TokenAuthenticator(),
	}
	return t, nil
}

// Client returns a client used to interact with the authn.TokenAuthenticator
// server.
func (a *TokenAuthenticatorPlugin) Client(
	broker *plugin.MuxBroker,
	c *rpc.Client,
) (interface{}, error) {
	t := &TokenAuthenticator{
		Broker: broker,
		Client: c,
	}
	return t, nil
}

// TokenAuthenticator is an implementation of authn.TokenAuthenticator that
// communicates over RPC.
type TokenAuthenticator struct {
	Broker *plugin.MuxBroker
	Client *rpc.Client
}

// TokenAuthenticatorServer is a net/rpc compatible structure for serving
// a TokenAuthenticator.
type TokenAuthenticatorServer struct {
	Broker             *plugin.MuxBroker
	TokenAuthenticator authn.TokenAuthenticator
}
