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
    const id = document.querySelector(".chatroom-selected")
    const forms = document.querySelectorAll(".form-chatroom")
    forms.forEach((form) =>{
      console.log(form)
      form.addEventListener("submit", (event) => {
        console.log(form.value())
      })
    })
  }
}
export { submit };
