json.extract! transaction, :id, :transaction_no, :transaction_type, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)