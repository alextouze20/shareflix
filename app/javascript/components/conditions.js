const conditions = () => {
  if(document.querySelector("#conditions")){
    const submitBtn = document.querySelector("input[type=submit]");
    const userConditions = document.querySelector(".userconditions")
    const acceptBtn = document.querySelector(".accept-btn")
    const form = document.querySelector("form")
    console.log(submitBtn)
    console.log(form)
    submitBtn.addEventListener("click", event => {
      event.preventDefault()
      userConditions.classList.remove("unselected_conditions")
      userConditions.classList.add("selected_conditions")
    })
    acceptBtn.addEventListener("click", event => {
      event.preventDefault();
      form.submit();
    })
  }
}

export { conditions };

