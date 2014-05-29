//= require pagehook_rails
Pagehook.register("articles/index", function(data) {
    alert(data.message);
});
