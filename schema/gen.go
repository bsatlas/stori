package schema

//go:generate esc -o=fs.go -pkg=schema -include=.*\.json$ -ignore=test-fixtures/* .
