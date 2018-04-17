json.extract! transaction, :id, :date, :amount, :from, :to, :user_id, :report_id, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
