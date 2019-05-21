  json.id @contact.id
  json.first_name @contact.first_name
  json.last_name @contact.last_name
  json.email @contact.email
  json.phone_number @contact.phone_number
  json.user contact.user.name
  json.current_user_id current_user.id
  json.current_user_name current_user.name
 
json.formatted do
  json.updated_at @contact.friendly_updated_at

  json.full_name @contact.full_name
  json.japan_phone_num @contact.japan

end
    
