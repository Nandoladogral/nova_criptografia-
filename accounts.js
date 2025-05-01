let users = JSON.parse(localStorage.getItem('usuarios')) || {};

function saveUsers() {
  localStorage.setItem('usuarios', JSON.stringify(users));
}
