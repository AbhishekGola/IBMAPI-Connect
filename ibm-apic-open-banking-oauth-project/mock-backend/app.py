from flask import Flask, jsonify, request
from datetime import datetime, timezone
app = Flask(__name__)

@app.get('/open-banking/v3.1/aisp/accounts')
def accounts():
    return jsonify({
      'Data': {'Account': [
        {'AccountId': 'acc-001', 'Currency': 'GBP', 'AccountType': 'Personal', 'Nickname': 'Current Account'},
        {'AccountId': 'acc-002', 'Currency': 'GBP', 'AccountType': 'Personal', 'Nickname': 'Savings'}]},
      'Links': {'Self': request.base_url},
      'Meta': {'TotalPages': 1},
      'x-fapi-interaction-id': request.headers.get('x-fapi-interaction-id')
    })

@app.get('/open-banking/v3.1/aisp/accounts/<account_id>/transactions')
def transactions(account_id):
    return jsonify({
      'Data': {'Transaction': [
        {'TransactionId': 'txn-001', 'AccountId': account_id,
         'Amount': {'Amount': '42.50', 'Currency': 'GBP'},
         'CreditDebitIndicator': 'Debit',
         'BookingDateTime': datetime.now(timezone.utc).isoformat()}]},
      'Links': {'Self': request.base_url}, 'Meta': {'TotalPages': 1}
    })

@app.get('/health')
def health(): return {'status': 'UP'}

app.run(host='0.0.0.0', port=8080)
