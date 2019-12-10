document.addEventListener('turbolinks:load', function() {
  var passageTimer = document.querySelector('.passage-timer');

  if (passageTimer) { startTimer(passageTimer) }
})

function startTimer(timer) {
  var timeLimit = timer.dataset.startValue;
  showTimer(timeLimit, timer)
  var timerId = setInterval(function() {
    timeLimit--
    showTimer(timeLimit, timer)
    if (timeLimit == 0) {
      clearInterval(timerId)
      alert('Закончилось время теста')
      window.location.replace(window.location + '/result')
    }
  }, 1000)
}

function showTimer(seconds, timer) {
    timer.textContent = parseInt(seconds / 60) + ' мин' + ' ' + (seconds % 60) + ' сек'
}
