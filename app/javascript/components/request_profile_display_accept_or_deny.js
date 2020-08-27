const request_profile_display_accept_or_deny = () => {
  const box = document.querySelector('.change-request-button-into-text')


  const accept = document.getElementById("change-request-button-into-accept");
  const deny = document.getElementById("change-request-button-into-deny");
  console.log(accept)

  if (box) {
    accept.addEventListener('submit', function() {

  //     if (y >= top) {

    console.log('test-accept')
    accept.innerHTML = '';


  //       box.style.position = "fixed";
  //       box.style.top = "4rem";
  //       box.style.right = "110px";
  //       boxLarge.style.position = "unset";
  //     }
  //   // else if (document.documentElement.scrollTop < box.top) {
  //   // console.log('test')
  //   // // box.style.position = "-webkit-sticky;";
  //   // box.style.position = "fixed";
  //   // box.style.top = "4rem";
  //   // box.style.right = "110px";

  //   // boxLarge.style.position = "unset";

  //   // }
    });
  }
}
export {request_profile_display_accept_or_deny}
