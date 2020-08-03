json.user_name @content.user.name
json.created_at @content.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.text @content.text
json.image @content.image_url
json.id @content.id