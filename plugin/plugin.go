package plugin

import (
	"github.com/hashicorp/go-plugin"
)

// VersionedPlugins is a map of PluginSets used to negotiate a compatible
// version between stori and plugin servers.
var VersionedPlugins = map[int]plugin.PluginSet{
	1: {
		"backend": &BackendPlugin{},
	},
}
