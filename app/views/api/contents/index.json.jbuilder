json.array! @contents do |content|
  json.text content.text
  json.image content.image.url
  json.created_at content.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.user_name content.user.name
  json.id content.id
end