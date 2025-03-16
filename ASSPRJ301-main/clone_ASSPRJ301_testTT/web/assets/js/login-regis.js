
function showRegister() {
    document.getElementById("loginForm").classList.add("hidden");
    document.getElementById("registerForm").classList.remove("hidden");
}

function showLogin() {
    document.getElementById("registerForm").classList.add("hidden");
    document.getElementById("loginForm").classList.remove("hidden");
}

window.onload = function () {
<% if (request.getAttribute("showRegisterForm") != null && (boolean) request.getAttribute("showRegisterForm")) { % >
        showRegister();
<% } else { % >
        showLogin();
<% } %>
};
