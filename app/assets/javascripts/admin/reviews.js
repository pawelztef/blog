$(function() {
  $('.display-btn').on('click', function(e) {
    var clicked = this;
    var url = '/admin/books/display_update?id='+clicked.id; 
    $.get(url, function(data){
    }).done(function(){ 
      var items = document.getElementsByClassName('display-btn');
      for(var i = 0; i<=items.length; i++) {
        items[i].classList.remove('displayed');
        items[i].innerText = 'display';
        if(items[i].id == clicked.id) {
          clicked.innerText = "displayed";
          clicked.classList.add('displayed');
          var titleTarget = document.querySelector('.current-book > h3');
          var title = clicked.closest('.book-details').firstElementChild.innerText
          titleTarget.innerText = title;
        }
      }
    });
  });
});
