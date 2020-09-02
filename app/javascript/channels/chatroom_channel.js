import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainers = document.querySelectorAll('.messages');
  if (messagesContainers) {
    messagesContainers.forEach((chatroom) =>{
      const id = chatroom.dataset.chatroomId;
      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
        received(data) {
          chatroom.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
        },
      });
    })
  }
}

export { initChatroomCable };
