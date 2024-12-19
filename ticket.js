const formdata = new FormData();

const requestOptions = {
  method: "GET",
  body: formdata,
  redirect: "follow"
};

fetch("http://localhost/zoo/zoo/tickets.php", requestOptions)
  .then((response) => response.text())
  .then((result) => console.log(result))
  .catch((error) => console.error(error));