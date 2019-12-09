document.addEventListener('turbolinks:load', function() {
  var passageTimer = document.querySelector('.passage-timer');

  if (passageTimer) { startTimer(passageTimer) }
})

function startTimer(passageTimer) {
  var startValue = passageTimer.dataset.startValue;
  passageTimer;
}
