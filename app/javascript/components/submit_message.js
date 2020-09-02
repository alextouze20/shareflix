// const postMessage = (chatroom, message) => {
//   fetch(`/api/v1/messages`, {
//     method: 'POST',
//     headers: { "Content-Type": "application/json" },
//     body: JSON.stringify({message: {content: message, chatroom_id: chatroom}})
//   }).then(response => response.json())
//     .then((data) => {
//     });
// };

const submit = () => {
  if(document.querySelector("#chatrooms")){
    const forms = document.querySelectorAll(".form-chatroom")
    forms.forEach((form) =>{
      console.log(form)
      form.addEventListener("submit", (event) => {
        const id = document.querySelector(".chatroom-selected").innerText
        console.log(id)
        const content = document.querySelector(`.content-${id}`);
        document.querySelector(`#messages-${id}`).insertAdjacentHTML("beforeend",
                                                                                  `<div class="message-container message message-from-user" id="message-<%= message.id %>">
                                                                                      <p>${content.value}</p>
                                                                                  </div>`
        );
        content.value = "";
      })
    })
  }
}
export { submit };
