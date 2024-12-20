const myHeaders = new Headers();
myHeaders.append("Content-Type", "application/x-www-form-urlencoded");

const urlencoded = new URLSearchParams();
urlencoded.append("mail", "ilana.coignet@gmail.com");
urlencoded.append("password", "isen");
urlencoded.append("role", "admin");
urlencoded.append("username", "ilanape");

const requestOptions = {
  method: "POST",
  headers: myHeaders,
  body: urlencoded,
  redirect: "follow"
};

fetch("http://localhost/zoo/zoo/users.php", requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.error(error));