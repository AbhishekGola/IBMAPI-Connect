#!/usr/bin/env bash
set -euo pipefail
apic validate ./apis/open-banking-oauth-provider.yaml
apic validate ./apis/open-banking-accounts-api.yaml
apic validate ./products/open-banking-product.yaml
