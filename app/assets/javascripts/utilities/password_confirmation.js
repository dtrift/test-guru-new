document.addEventListener('turbolinks:load', function() {
  var password_confirmation = document.querySelector('#user_password_confirmation')
  if (password_confirmation) { password_confirmation.oninput = passwordValue }
})

function passwordValue() {
  var password = document.querySelector('#user_password')
  var password_confirmation = document.querySelector('#user_password_confirmation')

  if (password.value == password_confirmation.value) {
    showIcon(document.querySelectorAll('.octicon-thumbsup'))
    hideIcon(document.querySelectorAll('.octicon-thumbsdown'))
  } else {
    hideIcon(document.querySelectorAll('.octicon-thumbsup'))
    showIcon(document.querySelectorAll('.octicon-thumbsdown'))
  }
}

function showIcon(icon) {
  for (var i = 0; i < icon.length; i++) {
    icon[i].classList.remove('hide')
  }
}

function hideIcon(icon) {
  for (var i = 0; i < icon.length; i++) {
    icon[i].classList.add('hide')
  }
}

