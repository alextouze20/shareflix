const request_profile_display_accept_or_deny = () => {
  const box = document.querySelector('.change-request-button-into-text')


  const accept = document.getElementById("change_request_button_into_accept");
  const deny = document.getElementById("change_request_button_into_deny");

  if (box) {
    accept.addEventListener('click', function() {

    setTimeout(() => { box.innerHTML = '<h2>Accepted!</h2>'; }, 50);

    });

    deny.addEventListener('click', function() {

    setTimeout(() => { box.innerHTML = '<h2>Denied!</h2>'; }, 50);

    });
  }
}
export {request_profile_display_accept_or_deny}
