# NeTEx protobuf definitions

This project contains setup to generate [Protocol Buffers Definition files](https://developers.google.com/protocol-buffers/) (proto files) from [NeTEx xml schema](https://github.com/entur/NeTEx).

The conversion is done using [schema2proto](https://github.com/entur/schema2proto) and configuration [netex_to_protobuf_config.yaml](netex_to_protobuf_config.yaml)

Based on a copy of https://github.com/NeTEx-CEN/NeTEx/commit/17c3b065ed5772e751dcdc6477360629604d2a0a (v1.10) (no tag or release exist yet)

## Building

`mvn clean install`

NOTE: 
There is a Maven profile `protoc` which is active by default. This profile performs Java compilation of the generated stubs, and is meant only as a step to verify that the protoc compiler can handle the resulting proto. The compilation step is heavy. To run without use

`mvn clean install -P'!protoc'`