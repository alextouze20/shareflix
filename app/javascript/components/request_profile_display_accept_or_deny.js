const request_profile_display_accept_or_deny = () => {
  // const box = document.querySelector('.change-request-button-into-text')


  const accepts = document.querySelectorAll(".change_request_button_into_accept");
  const denies = document.querySelectorAll(".change_request_button_into_deny");

  accepts.forEach((accept) => {

    const box = accept.parentNode
    accept.addEventListener('click', function() {

      setTimeout(() => { box.innerHTML = '<h2 class="request-status green">Accepted!</h2>'; }, 50);

    })
  });

  denies.forEach((deny) => {

    const box = deny.parentNode
    deny.addEventListener('click', function() {

      setTimeout(() => { box.innerHTML = '<h2 class="request-status red">Denied!</h2>'; }, 50);

    })
  });

}
export {request_profile_display_accept_or_deny}
