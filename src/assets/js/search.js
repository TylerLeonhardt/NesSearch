var searchBox = document.getElementById("searchbox");

if(searchBox) {
  searchBox.addEventListener('input', function(event) {

    var xhr = new XMLHttpRequest();
    xhr.withCredentials = true;

    xhr.addEventListener("readystatechange", function () {
      if (this.readyState === 4) {
        var jsonResponse = JSON.parse(this.responseText);

        var results = document.getElementById("results");
        while (results.firstChild) {
          results.removeChild(results.firstChild);
        }

        jsonResponse.data.forEach(function(result) {
          results.appendChild(ConvertToResultDiv(result))
        }, this);
      }
    });

    xhr.open("GET", "http://localhost:4000/api/search?query=" + encodeURIComponent(this.value));
    xhr.setRequestHeader("content-type", "application/json");
    xhr.setRequestHeader("cache-control", "no-cache");
    xhr.setRequestHeader("postman-token", "c9a510eb-f26a-c352-32aa-ae4d76a568c5");
    xhr.send();
    //document.getElementById("results").textContent = ;
  });
}

function ConvertToResultDiv(result) {
  var div = document.createElement('div');
  var title = document.createElement('h2');
  var publisher = document.createElement('h3');

  title.textContent = result.title
  publisher.textContent = result.publisher
  div.appendChild(title);
  div.appendChild(publisher);

  div.classList.add('card');
  return div;
}