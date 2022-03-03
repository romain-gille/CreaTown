import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["participationbutton", "textandbutton"];

  connect() {
    console.log("Hello from our first Stimulus controller");
    console.log(this.participationbuttonTarget);
  }

  addparticipation(event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    const url = this.participationbuttonTarget.href;
    const csrfToken = document.head.querySelector("[name='csrf-token']");
    console.log(csrfToken.content);
    let headers = new window.Headers({
      Accept: "text/plain",
      "X-Requested-With": "XMLHttpRequest",
    });
    if (csrfToken) {
      headers.append("X-CSRF-Token", csrfToken.content);
    }
    fetch(url, {
      method: "post",
      headers: headers,
    })
      .then((response) => response.text())
      .then((data) => {
        this.textandbuttonTarget.outerHTML = data;
      });
  }

  deleteparticipation(event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    const url = this.participationbuttonTarget.href;
    const csrfToken = document.head.querySelector("[name='csrf-token']");
    console.log(csrfToken.content);
    let headers = new window.Headers({
      Accept: "text/plain",
      "X-Requested-With": "XMLHttpRequest",
    });
    if (csrfToken) {
      headers.append("X-CSRF-Token", csrfToken.content);
    }
    fetch(url, {
      method: "delete",
      headers: headers,
    })
      .then((response) => response.text())
      .then((data) => {
        this.textandbuttonTarget.outerHTML = data;
      });
  }
}
