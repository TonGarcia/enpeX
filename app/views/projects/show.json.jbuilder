json.project do
  json.id @project.id
  json.name @project.name
  json.url_video @project.url_video
  json.creator @project.owner.name
  json.created_at @project.created_at
  json.updated_at @project.updated_at
end
