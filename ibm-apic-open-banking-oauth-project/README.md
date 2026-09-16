# IBM API Connect Open Banking OAuth Proxy PoC

This importable learning project contains:

- a native IBM API Connect OAuth provider API
- an OAuth-protected AISP-style Accounts API proxy
- an API Product and sandbox plan
- a local Flask resource-server mock
- validation, publication and test scripts

## Important boundary

This is a development PoC, not a production UK Open Banking/FAPI implementation. Before production, add mTLS, private_key_jwt client authentication, signed request objects, PAR, JARM where required, consent and authorisation services, SSA and Open Banking Directory validation, DCR, signing, certificate lifecycle, replay controls, audit and conformance testing.

## Flow

TPP application -> OAuth authorisation -> access token -> API Connect gateway -> OAuth scope enforcement -> Accounts proxy -> resource server.

## Run mock backend

```bash
docker compose up --build
curl http://localhost:8080/health
```

For API Studio running outside Docker, temporarily set `target-url` in the Accounts API to `http://host.docker.internal:8080` or a reachable host. For Kubernetes, expose the mock as a Service and use its service DNS name.

## Import into API Studio

1. Open API Studio and create/open a workspace.
2. Import `apis/open-banking-oauth-provider.yaml`.
3. Import `apis/open-banking-accounts-api.yaml`.
4. Import `products/open-banking-product.yaml`.
5. Replace every `REPLACE-*` value and set the environment-specific `target-url` property.
6. In API Manager, configure the Authentication URL user registry required by the OAuth provider. For a quick local test, you can instead adjust the provider through the form editor to use a supported test registry in your environment.
7. Validate the API and Product definitions.
8. Publish the Product to a sandbox Catalog.
9. Subscribe a test application to the Product and obtain its client ID.
10. Complete the authorisation-code flow, then invoke the Accounts endpoint with the bearer token and client ID.

## CLI

```bash
./scripts/validate.sh
export APIC_SERVER=platform-api.example.com
export APIC_ORG=open-banking
export APIC_CATALOG=sandbox
./scripts/publish.sh
```

## Production evolution

Recommended component separation:

- API Connect/DataPower: TLS termination, OAuth enforcement, routing, quotas, threat protection, analytics.
- Authorisation service: customer authentication and consent authorisation.
- Consent service: consent lifecycle and policy decisions.
- Directory/DCR service: SSA, software role, organisation and certificate validation.
- Resource server: accounts, balances, transactions and payments orchestration.

Do not commit keys, client secrets or production certificates. The `certs` directory is intentionally empty.
