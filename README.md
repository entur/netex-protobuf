# NeTEx protobuf definitions

This project contains setup to generate [Protocol Buffers Definition files](https://developers.google.com/protocol-buffers/) (proto files) from [NeTEx xml schema](https://github.com/entur/NeTEx).

The conversion is done using [schema2proto](https://github.com/entur/schema2proto) and configuration [netex_to_protobuf_config.yaml](netex_to_protobuf_config.yaml)

Based on a copy of https://github.com/NeTEx-CEN/NeTEx/commit/17c3b065ed5772e751dcdc6477360629604d2a0a pr 22. April 2020 (no tag or release exist yet)

## Building

`mvn clean install`

## Related project

See https://github.com/entur/netex-java-model for Java JAXB binding classes for the same xsd files
