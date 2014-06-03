json.array!(@users) do |user|
  json.extract! user, :id, :name, :username, :email, :gender, :locale
  json.url user_url(user, format: :json)
end
