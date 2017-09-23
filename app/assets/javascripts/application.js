// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require tinymce-jquery
//= require chosen-jquery
//= require bootstrap.min
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
  $('#burger').on('click', function() {
    $('#side-menu').toggleClass('hidden-xs');
  });
  $('.chosen-select').chosen();

  $("#flash").delay(500).show('normal', function(){
    $(this).delay(2500).slideUp();
  });

  $(window).on('resize load', function() {
    if($(window).width()>992) {
      // console.log($(window).width());
      if ($('.left').height() >= $('.right').height()) {
        $('.righT').height($('.left').height());
        $('.lefT').height($('.left').height());
      } else {
        $('.lefT').height($('.right').height());
        $('.righT').height($('.right').height());
      }
    } else {
      $('.lefT').height($('.left').height());
      $('.righT').height($('.right').height());
      console.log($('.lefT'));
    }
  });

});

