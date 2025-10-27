#!/usr/bin/env bash
set -e

PROTO_DIR=proto
OUT_DIR=gen

mkdir -p $OUT_DIR/go $OUT_DIR/ts

# Generate Go (respect go_package without duplicating paths)
protoc -I $PROTO_DIR \
  --go_out=$OUT_DIR/go --go_opt=paths=source_relative \
  --go-grpc_out=$OUT_DIR/go --go-grpc_opt=paths=source_relative \
  $(find $PROTO_DIR -name "*.proto")

# Generate TypeScript
protoc -I $PROTO_DIR \
  --plugin=./node_modules/.bin/protoc-gen-ts_proto \
  --ts_proto_out=$OUT_DIR/ts \
  --ts_proto_opt=esModuleInterop=true,forceLong=string \
  $(find $PROTO_DIR -name "*.proto")