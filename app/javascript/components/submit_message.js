const postMessage = (chatroom, message) => {
  fetch(`/api/v1/messages`, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({message: {content: message, chatroom_id: chatroom}})
  }).then(response => response.json())
    .then((data) => {
    });
};

const submit = () => {
  if(document.querySelector("#chatrooms")){
    document.querySelectorAll("submit").forEach((form) =>{
      form.addEventListener(("click"), () =>{
        const submitBtn = document.querySelector("input[type=submit]");
        const form = document.querySelector("#new_message")
        console.log(submitBtn)
        console.log(form)
        form.addEventListener("submit", event => {
          event.preventDefault()
          const msgChatroomId = form.querySelector("#message_chatroom_id").value;
          const msgUserId = form.querySelector("#message_user_id").value;
          const msgContent = form.querySelector("#message_content").value;
          console.log(msgChatroomId, msgUserId, msgContent);
          postMessage(msgChatroomId, msgContent)
          $(".messages").append(`
                  <div class="message message-from-user newmessage">
                    <p class = "btn-primary px-0">${msgContent}</p>
                  </div>
                `)
          const messages = document.querySelector(".messages")
          messages.scrollTop = messages.scrollHeight;
          console.log(messages)
          form.querySelector("#message_content").value = ""
        })
      })
    })
  }
}

export { submit };

