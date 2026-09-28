[![MvnRepository](https://badges.mvnrepository.com/badge/no.entur/netex-protobuf/badge.svg?label=MvnRepository)](https://mvnrepository.com/artifact/no.entur/netex-protobuf)

# NeTEx Protobuf definitions

This project contains setup to generate [Protocol Buffers Definition files](https://protobuf.dev/) (`.proto` files) from the [NeTEx XML schema](https://github.com/TransmodelEcosystem/NeTEx).

The conversion is done using [schema2proto](https://github.com/entur/schema2proto) and configuration [netex_to_protobuf_config.yaml](netex_to_protobuf_config.yaml)

## NeTEx schema version

The xsd files are not kept in this repository. They are downloaded at build time from a tagged source archive of
https://github.com/TransmodelEcosystem/NeTEx, selected by the `netex.xsd.version` property in [pom.xml](pom.xml) (the tag name
without the leading `v`). The current version is [v2.0.0](https://github.com/TransmodelEcosystem/NeTEx/releases/tag/v2.0.0).

Earlier versions were generated from Entur's fork https://github.com/entur/NeTEx (last from tag v1.0.16.1). Entur additions
in that fork that are not part of NeTEx 2.0 are reserved in [proto.lock](proto.lock), so their field numbers are not reused.
Where NeTEx 2.0 corrected the spelling of a name, the name was changed and the field number kept.

To build against another tag without editing the pom:

`mvn clean install -Dnetex.xsd.version=2.0.1`

The downloaded xsd files are treated as immutable upstream inputs; build-time schema adjustments are defined in
[remove_unwanted_structures.xslt](src/main/resources/xslt/remove_unwanted_structures.xslt). 

Backwards compatibility check is handled by `protolock` (https://github.com/nilslice/protolock) and called from Maven via plugin `proto-backwards-compat-maven-plugin` (https://github.com/salesforce/proto-backwards-compat-maven-plugin).

## Building

`mvn clean install`

NOTE:
There is three Maven profiles which are active by default:

 * `protoc` This profile performs Java compilation of the generated stubs
 * `javadoc` This profile generates javadoc jar for the generated stubs
 * `sources` This profile generates sources jar for the generated stubs

These profiles are used to verify that the protoc compiler can handle the resulting proto. The compilation step is heavy. To run without use

`mvn clean install -P'!protoc,!javadoc,!sources'`

## Handling breaking changes

If breaking changes needs to be accepted into the proto.lock file, run the following command to update it (do not delete as `schema2proto` needs the file for backwards compatibility check as well)

`protolock commit --force --protoroot target/proto/`

## Publishing
A jar containing `.proto` files is published to Maven Central.