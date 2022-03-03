import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["likebutton", "textandbutton"];

  connect() {
    console.log("Hello from our first Stimulus controller");
    console.log(this.likebuttonTarget);
  }

  addlike(event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    const url = this.likebuttonTarget.href;
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

  deletelike(event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    const url = this.likebuttonTarget.href;
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
