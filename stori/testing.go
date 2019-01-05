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

package stori

import (
	"os"
	"testing"

	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

// TestRegistry returns a fully initialized registry.
func TestRegistry(t *testing.T) *Registry {
	encoderConfig := zapcore.EncoderConfig{
		MessageKey:     "message",
		LevelKey:       "level",
		TimeKey:        "time",
		CallerKey:      "caller",
		StacktraceKey:  "stacktrace",
		EncodeLevel:    zapcore.CapitalColorLevelEncoder,
		EncodeTime:     zapcore.ISO8601TimeEncoder,
		EncodeDuration: zapcore.SecondsDurationEncoder,
		EncodeCaller:   zapcore.FullCallerEncoder,
	}

	logConfig := zap.Config{
		Level:            zap.NewAtomicLevelAt(zapcore.ErrorLevel),
		Development:      true,
		Encoding:         "console",
		EncoderConfig:    encoderConfig,
		OutputPaths:      []string{os.Stdout.Name()},
		ErrorOutputPaths: []string{os.Stderr.Name()},
	}

	logger, err := logConfig.Build()
	if err != nil {
		t.Fatalf("logger init failed: %v", err)
	}

	conf := testRegistryConfig(t, logger)
	reg, err := NewRegistry(conf)
	if err != nil {
		t.Fatalf("failed to initialize registry: %v", err)
	}

	return reg
}

// testRegistryConfig returns a RegistryConfig used for testing.
func testRegistryConfig(t *testing.T, logger *zap.Logger) *RegistryConfig {
	conf := &RegistryConfig{
		Logger: logger,
	}
	return conf
}
