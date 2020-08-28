const postMessage = (chatroom, user, message) => {
  fetch(`/api/v1/messages`, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(message)
  }).then(response => response.json())
    .then((data) => {
    });
};

const submit = () => {
  if(document.querySelector("#chatrooms")){
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
      postMessage(msgChatroomId, msgUserId, msgContent)
    })
  }
}

export { submit };

