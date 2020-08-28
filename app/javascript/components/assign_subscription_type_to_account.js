const assign_subscription_type_to_account = () => {
  // const box = document.querySelector('.change-request-button-into-text')


  const forms = document.querySelectorAll(".form-subscription");
  const cards = document.querySelectorAll(".card-product");
  console.log(cards)
  cards.forEach((card) => {
    console.log(card)
    const card_id = card.dataset.typeId
    // const form_id = subscription_types.querySelector('')
    const found = Array.from(forms).find(form => card_id === form.dataset.typeId);


    // const box = deny.parentNode
    card.addEventListener('click', () => {
      found.submit();
    })
  });
}

export {assign_subscription_type_to_account}
