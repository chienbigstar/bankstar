$(document).on("ready", function(){
  $('.loader').hide();
  $("#create_app").click(function(){
    $('.loader').show();
    $(this).attr("disabled", "disabled");
    $url = $('input[name="app[url]"]').val();
    $token = $('input[name="app[token]"]').val();

    $.ajaxPrefilter( function (options) {
    if (options.crossDomain && jQuery.support.cors) {
    var http = (window.location.protocol === 'http:' ? 'http:' : 'https:');
    options.url = http + '//cors-anywhere.herokuapp.com/' + options.url;
    }});
    $.ajax({
        url: $url,
        success: function(data) {
          $(this).attr("disabled", "none");
          $meta = data.split($token);
          $('.loader').hide();
          if($meta.length >1)
            $("form").submit();
          else alert("wrong!");
        },
        error: function() {
          $('.loader').hide();
          $(this).attr("disabled", "none");
          alert("wrong!");
        }
      });
  });
});
