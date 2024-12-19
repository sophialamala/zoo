const requestOptions = {
    method: "GET",
    redirect: "follow"
  };
  
  fetch("http://localhost/webdav/zoo/enclos.php", requestOptions)
    .then((response) => response.text())
    .then((result) => console.log(result))
    .catch((error) => console.error(error));