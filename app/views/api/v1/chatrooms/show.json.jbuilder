json.extract! @chatroom, :id
json.messages @chatroom.messages do |message|
  json.extract! message, :id, :user, :content
end
