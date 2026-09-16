#!/usr/bin/env bash
set -euo pipefail
: "${GATEWAY_BASE:?Example: https://gateway.example.com/catalog}"
: "${CLIENT_ID:?Set application client ID}"
: "${ACCESS_TOKEN:?Set an OAuth access token}"
CORRELATION_ID="$(python3 -c 'import uuid; print(uuid.uuid4())')"
curl -sk "$GATEWAY_BASE/open-banking/v3.1/aisp/accounts" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -H "X-IBM-Client-Id: $CLIENT_ID" \
  -H "x-fapi-interaction-id: $CORRELATION_ID" \
  -H "Accept: application/json"
