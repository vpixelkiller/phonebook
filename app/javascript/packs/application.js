require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

function showFloatingAlert(message, alertClass) {
  var alert = document.createElement("div");
  alert.className = "floating-alert " + alertClass;
  alert.innerText = message;
  document.querySelector("#floating-alert-container").appendChild(alert);

  var duration = 2000;
  setTimeout(function () {
    alert.style.opacity = "0";
    alert.style.height = "0";
    alert.style.margin = "0";
    alert.style.padding = "0";
    setTimeout(function () {
      alert.remove();
    }, 300);
  }, duration);
}

document.addEventListener("DOMContentLoaded", function () {
  var alerts = document.querySelectorAll(".floating-alert");
  alerts.forEach(function (alert) {
    var message = alert.getAttribute("data-message");
    var alertClass = alert.getAttribute("data-alert-class");
    showFloatingAlert(message, alertClass);
  });
});

