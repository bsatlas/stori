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

package authn

// TokenAuthenticator is an interface for authenticating requests to the server.
type TokenAuthenticator interface {
	AuthenticateToken(token string) (AccountInfo, bool, error)
}

// AccountInfo is an interface for exposing account information.
type AccountInfo interface {
	// Name returns the name that uniquely identifies this user among all other
	// active users.
	Name() string

	// UID returns a unique value for a particular account that will change if
	// the account is removed from the system and another account is added with
	// the same name.
	UID() string

	// Groups returns the names of the groups the user is a member of.
	Groups() []string
}
