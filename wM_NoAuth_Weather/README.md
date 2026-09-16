# wm_NoAuth_Petstore

## Overview

This project contains a Petstore API with inovke and logging policy. This API is not authenticated with any security schemes.

## Assets included

This sample contains the following assets:

### API Definitions

- **PetstoreAPI.yml** - API asset
- **PetstoreAPI-spec.yml** - API specifications

### Policies

- **wM_PolicySequence.yml** - Policy asset of webMethods Gateway
- **wM_Invoke.yml** - Invoke/Routing policy
- **wM_Log.yml** - Logging policy

### Tests

- **Sanity_Test.yml** - Sanity test for the PetstoreAPI
- **Basic_Assertion.yml** - Default assertions checking the status code, message and response time.

## Getting Started

1. Import the sample
2. Publish to a catalog containing webMethods API Gateway
3. For validation, use Tryout or run the tests present under the tests fodler.
