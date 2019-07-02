# NeTEx protobuf definitions

This project contains setup to generate [Protocol Buffers Definition files](https://developers.google.com/protocol-buffers/) (proto files) from [NeTEx xml schema](https://github.com/entur/NeTEx).

The conversion is done using [schema2proto](https://github.com/entur/schema2proto) and configuration [netex_to_protobuf_config.yaml](netex_to_protobuf_config.yaml)

## Building

Downloads the NeTEx-XML XSD files from https://github.com/entur/NeTEx and generates java model using jaxb.

You need xmlstarlet installed.

`mvn clean install`
