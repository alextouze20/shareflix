import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainers = document.querySelectorAll('.messages');
  const chatroomsContainers = document.querySelector('.chatroom-container');

  if (messagesContainers && chatroomsContainers) {
    const currentUserId = chatroomsContainers.dataset.currentUserId;
    console.log(currentUserId);
    messagesContainers.forEach((chatroom) =>{
      const id = chatroom.dataset.chatroomId;
      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
        received(data) {
          chatroom.insertAdjacentHTML('beforeend', data.message); // called when data is broadcast in the cable
          const messages = chatroom.querySelectorAll('.message-container');
          if (currentUserId == data.author_id) {
            messages[messages.length - 1].classList.add('message-from-user');
            chatroom.scrollTop = chatroom.scrollHeight;
            document.querySelectorAll("#message_content").forEach((input)=>{
              input.value = ""
            })
            messages[messages.length - 1].querySelector(".photo-user").classList.remove("d-none");
          } else {
            messages[messages.length - 1].classList.add('message-not-user');
            messages[messages.length - 1].querySelector(".photo-other").classList.remove("d-none");
          }
        },
      });
    });
  }
}

export { initChatroomCable };
