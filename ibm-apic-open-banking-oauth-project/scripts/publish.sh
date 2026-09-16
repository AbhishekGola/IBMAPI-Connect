#!/usr/bin/env bash
set -euo pipefail
: "${APIC_SERVER:?Set APIC_SERVER}"
: "${APIC_ORG:?Set APIC_ORG}"
: "${APIC_CATALOG:?Set APIC_CATALOG}"
apic login --server "$APIC_SERVER" --realm provider/default-idp-2
apic products:publish ./products/open-banking-product.yaml --server "$APIC_SERVER" --org "$APIC_ORG" --catalog "$APIC_CATALOG"
