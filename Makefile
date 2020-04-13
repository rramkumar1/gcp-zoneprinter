PKG ?= github.com/rramkumar/gcp-zoneprinter

# List of binaries to build. You must have a matching Dockerfile.BINARY
# for each BINARY.
CONTAINER_BINARIES ?= zoneprinter

# Push to the staging registry.
REGISTRY ?= gcr.io/rramkumar-gke-dev

ARCH ?= amd64
ALL_ARCH := amd64

# Image to use for building.
BUILD_IMAGE ?= golang:1.12.3-alpine
# Containers will be named: $(CONTAINER_PREFIX)-$(BINARY)-$(ARCH):$(VERSION).
CONTAINER_PREFIX ?= gcp

VERSION ?= $(shell git describe --tags --always --dirty)

# Set to 1 to print more verbose output from the build.
VERBOSE ?= 0

# Include standard build rules.
include build/rules.mk
