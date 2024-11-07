import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

// Connects to data-controller="notification"
export default class extends Controller {
    close() {
        $(this.element).addClass("hidden");
    }
}
