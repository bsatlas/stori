package plugin

import (
	"net/rpc"

	"github.com/atlaskerr/stori/stori"

	"github.com/hashicorp/go-plugin"
)

// BackendPlugin implements plugin.Plugin.
type BackendPlugin struct {
	Backend func() stori.Backend
}

// Server returns a backend that can be communicates via RPC.
func (be *BackendPlugin) Server(broker *plugin.MuxBroker) (interface{}, error) {
	return &BackendServer{
		Broker:  broker,
		Backend: be.Backend(),
	}, nil
}

// Client returns client used to interact with the backend server.
func (be *BackendPlugin) Client(
	*plugin.MuxBroker, *rpc.Client) (interface{}, error) {
	return new(interface{}), nil
}

// BackendServer is a net/rpc compatible structure for serving a backend.
type BackendServer struct {
	Broker  *plugin.MuxBroker
	Backend stori.Backend
}
