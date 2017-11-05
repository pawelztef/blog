$(function(){
  $('#new_project_image').fileupload({
    dataType: "script",
    add: function(e, data) {
      const types = /(\.|\/)(gif|jpe?g|png)$/i;
      const file = data.files[0];
      if (types.test(file.type) || types.test(file.name)) {
        return data.submit();
      } else {
        return alert(`${file.name} is not a gif, jpeg, or png image file`);
      }
    },
    progressall: function (e, data) {
      var progress = parseInt(data.loaded / data.total * 100, 10);
      $('#progress .bar').css(
        'width',
        progress + '%'
      );
    },
    done: function (e, data) {
      $('#progress .bar').css(
        'width','0%'
      );
      $('.flashes').append(" <div id='flash' class='alert alert-info alert-dismissible' role='alert'> <p class='notice'> Project images was successfully uploaded </p> </div>")
  .delay(500).delay(500).show('normal', function() {
    $(this).delay(2500).slideUp(); });

    }
  });
});
