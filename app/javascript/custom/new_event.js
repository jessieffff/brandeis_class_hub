// Add toggle listeners to listen for clicks.
document.addEventListener("turbo:load", function() {
  let new_event = document.querySelector("#new-event");
  new_event.addEventListener("click", function(new_event) {
    new_event.preventDefault();
    let menu = document.querySelector("#new-event-menu");
    menu.classList.toggle("active");
  });
});