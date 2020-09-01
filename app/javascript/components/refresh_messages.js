const refreshMethod = (id) => {
  const chatSpan = document.querySelector(`.chatroom${id}`)
  chatSpan.click()
  console.log(id)
}
const refresh = () => {
  if (document.querySelector("message")){
    const chatroomId = document.querySelector("#message_chatroom_id")
    setInterval(refreshMethod(chatroomId), 10000);
  }

}
export { refresh };
