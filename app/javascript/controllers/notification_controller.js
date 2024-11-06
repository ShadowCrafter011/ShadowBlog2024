import { Controller } from "@hotwired/stimulus";
import $ from "jquery";

// Connects to data-controller="notification"
export default class extends Controller {
    static targets = ["body"];

    connect() {
        if ($(this.bodyTarget).text()) {
            $(this.element).removeClass("hidden");
        }
    }

    close() {
        $(this.element).addClass("hidden");
    }
}
