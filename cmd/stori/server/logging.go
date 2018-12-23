package server

import (
	"os"

	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

// NewLogger initializes a new logger. When dev is set to true, structured
// logging is disabled and all logs will be output to the console.
func NewLogger(lvl string, dev bool) (l *zap.Logger, err error) {
	var ll zapcore.Level

	switch lvl {
	case "debug":
		ll = zapcore.DebugLevel
	case "info":
		ll = zapcore.InfoLevel
	case "warn":
		ll = zapcore.WarnLevel
	case "error":
		ll = zapcore.ErrorLevel
	case "dpanic":
		ll = zapcore.DPanicLevel
	case "panic":
		ll = zapcore.PanicLevel
	case "fatal":
		ll = zapcore.FatalLevel
	}

	levelEncoder := func() zapcore.LevelEncoder {
		if dev {
			return zapcore.CapitalColorLevelEncoder
		}
		return zapcore.CapitalLevelEncoder
	}()

	encoderConfig := zapcore.EncoderConfig{
		MessageKey:     "message",
		LevelKey:       "level",
		TimeKey:        "time",
		CallerKey:      "caller",
		StacktraceKey:  "stacktrace",
		EncodeLevel:    levelEncoder,
		EncodeTime:     zapcore.ISO8601TimeEncoder,
		EncodeDuration: zapcore.SecondsDurationEncoder,
		EncodeCaller:   zapcore.FullCallerEncoder,
	}

	logEncoding := func() string {
		if dev {
			return "console"
		}
		return "json"
	}()

	logConfig := zap.Config{
		Level:            zap.NewAtomicLevelAt(ll),
		Development:      dev,
		Encoding:         logEncoding,
		EncoderConfig:    encoderConfig,
		OutputPaths:      []string{os.Stdout.Name()},
		ErrorOutputPaths: []string{os.Stderr.Name()},
	}

	l, err = logConfig.Build()
	if err != nil {
		panic(err)
	}
	return
}
