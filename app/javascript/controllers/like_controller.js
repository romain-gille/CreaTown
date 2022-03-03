import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["likebutton"];

  connect() {
    console.log("Hello from our first Stimulus controller");
    console.log(this.likebuttonTarget);
  }

  togglelike(event) {
    console.log("test");
    // window.open(page);
    event.preventDefault();
  }
}
