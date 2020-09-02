import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ['tab']

  connect() {
    // document.addEventListener('turbolinks:load', () => {
      const accountTab = this.element.dataset.tab;
      if (accountTab === "accounts") {
        document.getElementById('nav-own-accounts-tab').click();
      }
    // });
  }
}
