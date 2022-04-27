#!/bin/bash

# Update and install Go modules
go mod tidy

# Install fot reload tool
go install github.com/cosmtrek/air@v1.29.0

# Run http server as hot reload
air -c .air.toml