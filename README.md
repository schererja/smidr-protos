# Smidr Protos

Protocol Buffer definitions for the Smidr API.

## Structure

```text
smidr-protos/
├── proto/              # Proto definitions
│   └── smidr.proto    # Main Smidr service API
├── gen/               # Generated code (gitignored)
│   ├── go/           # Go stubs
│   └── ts/           # TypeScript stubs
├── buf.yaml          # Buf workspace config
└── buf.gen.yaml      # Code generation config
```

## Generating Code

Generate all language stubs:

```sh
buf generate
```

This generates:

- **Go**: `gen/go/smidr/v1/` with gRPC service and message types
- **TypeScript**: `gen/ts/` with grpc-js client stubs

## Using in Other Projects

### Go

Add as a dependency to your `go.mod`:

```sh
go get github.com/schererja/smidr-protos@latest
```

Import in your code:

```go
import smidrv1 "github.com/schererja/smidr-protos/gen/go/smidr/v1"
```

### TypeScript/Node

Once published to npm as `@smidr/protos`:

```sh
npm install @smidr/protos
```

```ts
import { SmidrClient } from "@smidr/protos";
```

## Development

1. Make changes to `proto/smidr.proto`
2. Run `buf lint` to validate
3. Run `buf breaking --against '.git#branch=main'` to check for breaking changes
4. Regenerate code: `buf generate`
5. Commit the proto (not the generated code)
6. Tag and push for consumption by other repos

## Versioning

This repo follows semantic versioning via Git tags:

- Patch: backward-compatible bug fixes to comments/docs
- Minor: backward-compatible new fields or RPCs
- Major: breaking changes to existing APIs

Consumers should pin to a specific version tag in their dependencies.
