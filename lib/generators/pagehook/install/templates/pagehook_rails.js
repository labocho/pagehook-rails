//= require pagehook_rails/pagehook
// Register event handler
document.addEventListener("DOMContentLoaded", Pagehook.handler);
if (typeof(Turbolinks) !== "undefined") {
    document.addEventListener("page:load", Pagehook.handler);
}
