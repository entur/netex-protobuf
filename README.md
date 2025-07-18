# NeTEx Protobuf definitions

This project contains setup to generate [Protocol Buffers Definition files](https://protobuf.dev/) (`.proto` files) from the [NeTEx XML schema](https://github.com/entur/NeTEx).

The conversion is done using [schema2proto](https://github.com/entur/schema2proto) and configuration [netex_to_protobuf_config.yaml](netex_to_protobuf_config.yaml)

Based on a copy of https://github.com/entur/NeTEx/commit/55cd207e7b6d49ea0aa2905fd4adee1241bad6cb (v1.11) (no tag or release exist yet)

Backwards compatibility check is handled by `protolock` (https://github.com/nilslice/protolock) and called from Maven via plugin `proto-backwards-compat-maven-plugin` (https://github.com/salesforce/proto-backwards-compat-maven-plugin).

## Building

`mvn clean install`

## Handling breaking changes

If breaking changes needs to be accepted into the proto.lock file, run the following command to update it (do not delete as `schema2proto` needs the file for backwards compatibility check as well)

`protolock commit --force --protoroot target/proto/`
