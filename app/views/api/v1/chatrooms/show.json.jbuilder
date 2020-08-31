json.extract! @chatroom, :id
json.messages @chatroom.messages.reverse do |message|
  json.extract! message, :id, :user, :content
end
