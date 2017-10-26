$(function() {
  $('.display-btn').on('click', function(e) {
    let clicked = this;
    let url = '/admin/books/display_update?id='+clicked.id; 
    $.get(url, function(data){
    }).done(function(){ 
      let items = document.getElementsByClassName('display-btn');
      for(let i = 0; i<=items.length; i++) {
        items[i].classList.remove('displayed');
        items[i].innerText = 'display';
        if(items[i].id == clicked.id) {
          clicked.innerText = "displayed";
          clicked.classList.add('displayed');
          let titleTarget = document.querySelector('.current-book > h3');
          let title = clicked.closest('.book-details').firstElementChild.innerText
          titleTarget.innerText = title;
        }
      }
    });
  });
});
