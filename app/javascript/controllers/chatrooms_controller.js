import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'chatroom', 'messages' ];
  toto() {
    const id = event.currentTarget.dataset.id;
    document.querySelectorAll(".chatroom").forEach((chatroom) => {
      chatroom.classList.remove("clicked")
      console.log("clickedRemooved")
    })
    document.querySelectorAll(".messages").forEach((chat) => {
      chat.classList.add("d-none")
    })
    document.querySelectorAll(".form-chatroom").forEach((form) =>{
      form.classList.add("d-none")
    })
    console.log(id)
    document.querySelector(`#messages-${id}`).classList.remove("d-none")
    document.querySelector(`.form-${id}`).classList.remove("d-none")
    event.currentTarget.classList.add("clicked")
    event.preventDefault();
    const formMessage = document.querySelector(".form-message")
    console.log(formMessage)
    const chatroomId = document.querySelector("#message_chatroom_id")
    const messages = document.querySelector(".messages")
    const userId = parseInt(document.querySelector("[data-user-id]").dataset.userId, 10)
    formMessage.classList.remove("d-none")
    //var interval = setInterval(refreshMethod(), 3000);
  }
}
