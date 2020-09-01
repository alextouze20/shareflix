import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'chatroom', 'messages' ];
  toto() {
    document.querySelectorAll(".chatroom").forEach((chatroom) => {
      chatroom.classList.remove("clicked")
      console.log("clickedRemooved")
    })
    event.currentTarget.classList.add("clicked")
    event.preventDefault();
    const id = event.currentTarget.dataset.id;
    const formMessage = document.querySelector(".form-message")
    console.log(formMessage)
    const chatroomId = document.querySelector("#message_chatroom_id")
    chatroomId.value = id
    const messages = document.querySelector(".messages")
    const userId = parseInt(document.querySelector("[data-user-id]").dataset.userId, 10)
    console.log(chatroomId)
    const refreshMethod = () => {
      const chatSpan = document.querySelector(".clicked")
      chatSpan.click()
      console.log(id)
    }
    fetch(`/api/v1/chatrooms/${id}`)
      .then(response => response.json())
      .then((data) => {
        messages.innerHTML = "";
        var countMsg = 0;
        data.messages.forEach (message => {
          if (userId === message.user.id) {
            messages.insertAdjacentHTML("afterbegin", `
              <div class="message message-from-user message${countMsg}">
                <p class = "btn-primary px-0">${message.content}</p>
              </div>
            `
          );
          }
          else{
            messages.insertAdjacentHTML("afterbegin", `
              <div class="message message-not-user message${countMsg}">
                <p class = "btn-success px-0">${message.content}</p>
              </div>
            `
          );
          }
        countMsg += 1
      });
    if(formMessage.classList.contains("d-none")){
      document.querySelector(".message0").scrollIntoView();
    }
    formMessage.classList.remove("d-none")
    var interval = setInterval(refreshMethod(), 3000);
    });
  }
}

