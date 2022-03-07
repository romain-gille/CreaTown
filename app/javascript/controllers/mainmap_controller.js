import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["mapbutton", "content"];

  connect() {
    console.log("Hello from the map controller");
    console.log(this.mapbuttonTarget);
    console.log(this.contentTarget);
  }

  toggleview(event) {
    event.preventDefault();
    event.stopImmediatePropagation();
    const url = this.mapbuttonTarget.action;
    fetch("/main", {
      method: "get",
      headers: { Accept: "text/plain" },
    })
      .then((response) => response.text())
      .then((data) => {
        console.log(data);
        this.contentTarget.outerHTML = data;
      });
  }
}
