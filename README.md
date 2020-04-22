# NeTEx protobuf definitions

This project contains setup to generate [Protocol Buffers Definition files](https://developers.google.com/protocol-buffers/) (proto files) from [NeTEx xml schema](https://github.com/entur/NeTEx).

The conversion is done using [schema2proto](https://github.com/entur/schema2proto) and configuration [netex_to_protobuf_config.yaml](netex_to_protobuf_config.yaml)

Based on a copy of https://github.com/entur/NeTEx/tree/nick_11 pr 5th of Aug 2019 (this branch contains updates from Nick Knowles regarding ticketing)

## Building

`mvn clean install`

## Related project

See https://github.com/entur/netex-java-model for Java JAXB binding classes for the same xsd files
