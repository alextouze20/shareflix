json.array! @chatrooms do |chatroom|
  json.extract! chatroom, :id
end
