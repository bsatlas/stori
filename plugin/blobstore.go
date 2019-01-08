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

	"github.com/atlaskerr/stori/storage"

	"github.com/hashicorp/go-plugin"
)

// BlobStorePlugin implements plugin.Plugin.
type BlobStorePlugin struct {
	BlobStore func() storage.BlobStore
}

// Server returns a blobstore that can communicates via RPC.
func (bs *BlobStorePlugin) Server(
	broker *plugin.MuxBroker,
) (interface{}, error) {
	return &BlobStoreServer{
		Broker:    broker,
		BlobStore: bs.BlobStore(),
	}, nil
}

// Client returns client used to interact with the blobstore server.
func (bs *BlobStorePlugin) Client() {}

// BlobStore is an implementation of stori.BlobStore that communicates over RPC.
type BlobStore struct {
	Broker *plugin.MuxBroker
	Client *rpc.Client
}

// BlobStoreServer is a net/rpc compatible structure for serving a blobstore
type BlobStoreServer struct {
	Broker    *plugin.MuxBroker
	BlobStore storage.BlobStore
}
