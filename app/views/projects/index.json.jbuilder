json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :url_video, :user_id
  json.url project_url(project, format: :json)
end
