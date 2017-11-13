$(function() {
  var tag = $('#tags-2');
  var range = 350;
  $(window).on('load scroll', function () {
    $('.project').each(function() {
      dimElement($(this), range);
    });
  });
});


function dimElement(elem, range) {
  var elemPos = Math.abs(((elem.offset().top+(elem.outerHeight()/2)) - ($(window).scrollTop() - 50 + $(window).outerHeight()/2))),
    calc2 = -(elemPos - range) / range;

  elem.css({ 'opacity': calc2 });
  if (calc2 > '1') {
    elem.css({ 'opacity': 1 });
  } else if ( calc2 < '0' ) {
    elem.css({ 'opacity': 0 });
  }
};
