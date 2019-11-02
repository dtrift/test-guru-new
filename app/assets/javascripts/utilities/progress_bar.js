document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar');

  if (progressBar) { valueProgressBar(progressBar) }
})

function valueProgressBar(progressBar) {
  var currentValue = progressBar.dataset.currentValue;
  var maxValue = progressBar.dataset.maxValue;
  var width = currentValue / maxValue * 100;
  progressBar.style.width = width + '%';
}
