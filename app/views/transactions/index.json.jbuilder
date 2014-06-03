json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :value, :user_id, :project_id
  json.url transaction_url(transaction, format: :json)
end
