$(document).on('ready page:load', function() {
  function display_search_results() {
    //ready_State === 4 means that the asynchronous request completed successfully
    if (this.readyState === 4) {
      console.log(this);
      document.getElementById('products').innerHTML = this.responseText;
    }
  }

  var form = document.getElementById('search-form');
  form.addEventListener('submit', function(event) {
    event.preventDefault();
    var searchValue = document.getElementById('search').value;

    var xhr = new XMLHttpRequest();
    xhr.onload = display_search_results;
    xhr.open('GET', '/products?search=' + searchValue, true);
    xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
    xhr.send();
  });
});