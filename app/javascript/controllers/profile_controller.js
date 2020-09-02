import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ['tab']

  connect() {
    // document.addEventListener('turbolinks:load', () => {
      const accountTab = this.element.dataset.tab;
      if (accountTab === "accounts") {
        document.getElementById('nav-own-accounts-tab').click();
      } else if (accountTab === "borrowed_accounts") {
        document.getElementById('nav-others-accounts-tab').click();
      }
      else if (accountTab === "requests") {
        document.getElementById('nav-requests-tab').click();
      }

    // });
  }
}
