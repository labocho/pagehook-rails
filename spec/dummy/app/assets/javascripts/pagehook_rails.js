//= require pagehook_rails/pagehook
// Register event handler
if (typeof(Turbolinks) === "undefined") {
    document.addEventListener("DOMContentLoaded", Pagehook.handler);
} else {
    document.addEventListener("page:change", Pagehook.handler);
}
