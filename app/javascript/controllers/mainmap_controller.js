import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["mapbutton", "content"];

  connect() {
    console.log("Hello from the map controller");
    console.log(this.mapbuttonTarget);
    console.log(this.contentTarget);
  }

  toggleview() {}
}
