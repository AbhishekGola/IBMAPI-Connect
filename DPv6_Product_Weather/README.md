# DPv6_Product_Petstore

## Overview

This project contains a Product, Plan and a Petstore API with invoke and logging policy.

## Assets Included

This sample contains the following assets:

### API Definitions

- **PetstoreAPI.yml** - API asset
- **PetstoreAPI-spec.json** - API specifications

### Policies

- **DPv6_Assemblyyml** - Policy asset of DataPower APIGateway
- **DPv6_Invoke.yml** - Invoke/Routing policy
- **DPv6_Log.yml** - Logging policy

### Products & Plans

- **DPv6_Product.yml** - Product asset of DataPower APIGateway
- **DPv6_Plan.yml** - Plan asset of DataPower APIGateway
- **DPv6_Quota.yml** - Quota asset of DataPower APIGateway
--

### Tests

- **Sanity_Test.yml** - Sanity test for the PetstoreAPI
- **Basic_Assertion.yml** - Default assertions checking the status code, message and response time.
- **Default_Environment.yml** - An environment file with a variable for referring clientId.

## Getting Started

1. Import the Sampleac
2. Publish to a catalog containing DataPower APIGateway
3. Go to Manage -> Catalog and create a consumer org, application and a subscription for the API.
4. For validation, use Tryout or run the tests present under the tests fodler.
5. For Tryout, pass the clientId in the header with the header name "X-IBM-Client-Id"
6. For executing the tests, replace the "clientId" variable value in the environment file under tests with the key from the created application.
