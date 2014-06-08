json.array!(@projects) do |project|
  json.extract! project, :id, :name, :url_video, :creator_id
  json.url project_url(project, format: :json)
end
