package plugin

import (
	"net/rpc"

	"github.com/hashicorp/go-plugin"
)

// BackendPlugin implements plugin.Plugin.
type BackendPlugin struct{}

// Server returns a backend that can be communicates via RPC.
func (be *BackendPlugin) Server(*plugin.MuxBroker) (interface{}, error) {
	return new(interface{}), nil
}

// Client returns client used to interact with the backend server.
func (be *BackendPlugin) Client(
	*plugin.MuxBroker, *rpc.Client) (interface{}, error) {
	return new(interface{}), nil
}
