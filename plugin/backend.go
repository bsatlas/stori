package plugin

import (
	"net/rpc"

	"github.com/atlaskerr/stori/storage"

	"github.com/hashicorp/go-plugin"
)

// BackendPlugin implements plugin.Plugin.
type BackendPlugin struct {
	Backend func() storage.Backend
}

// Server returns a backend that can communicates via RPC.
func (be *BackendPlugin) Server(broker *plugin.MuxBroker) (interface{}, error) {
	return &BackendServer{
		Broker:  broker,
		Backend: be.Backend(),
	}, nil
}

// Client returns client used to interact with the backend server.
func (be *BackendPlugin) Client(
	broker *plugin.MuxBroker,
	c *rpc.Client,
) (interface{}, error) {
	return &Backend{Broker: broker, Client: c}, nil
}

// Backend is an implementation of stori.Backend that communicates over RPC.
type Backend struct {
	Broker *plugin.MuxBroker
	Client *rpc.Client
}

// BackendServer is a net/rpc compatible structure for serving a backend.
type BackendServer struct {
	Broker  *plugin.MuxBroker
	Backend storage.Backend
}
