document.addEventListener("turbo:load", function () {

    let new_event = document.querySelector("#test");
    console.log(new_event)
    new_event.addEventListener("click", function(new_event) {
    window.location.href = document.querySelector("textarea").value;
    console.log(new_event)
   });
});