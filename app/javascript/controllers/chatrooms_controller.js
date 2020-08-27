import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'chatroom', 'messages' ];

  toto() {
    event.preventDefault();
    const id = event.currentTarget.dataset.id;
    const formMessage = document.querySelector(".form-message")
    console.log(formMessage)
    formMessage.classList.remove("d-none")
    const chatroomId = document.querySelectorAll(".chatroom-id")
    chatroomId.value = id
    const messages = document.querySelector(".messages")
    const userId = parseInt(document.querySelector("[data-user-id]").dataset.userId, 10)
    console.log(chatroomId)
    fetch(`http://localhost:3000/api/v1/chatrooms/${id}`)
      .then(response => response.json())
      .then((data) => {
        messages.innerHTML = "";
        data.messages.forEach (message => {
          if (userId === message.user.id) {
            messages.insertAdjacentHTML("afterbegin", `
              <div class="message message-from-user">
                <p class = "btn-primary px-0">${message.content}</p>
              </div>
            `
          );
          }
          else{
            messages.insertAdjacentHTML("afterbegin", `
              <div class="message message-not-user">
                <p class = "btn-success px-0">${message.content}</p>
              </div>
            `
          );
          }
      });
    });
  }
}
