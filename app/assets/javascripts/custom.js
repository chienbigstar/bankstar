$(document).on("turbolinks:load", function(){
  $('.loader').hide();
  $("#create_app").click(function(){
    $current = this;
    $('.loader').show();
    $(this).attr("disabled", "disabled");
    $url = $('input[name="app[url]"]').val();
    if($url == ""){
      alert("not have url");
      return;
    }
    $token = $('input[name="app[token]"]').val();

    $.ajaxPrefilter( function (options) {
    if (options.crossDomain && jQuery.support.cors) {
    var http = (window.location.protocol === 'http:' ? 'http:' : 'https:');
    options.url = http + '//cors-anywhere.herokuapp.com/' + options.url;
    }});
    $.ajax({
        url: $url,
        success: function(data) {
          $($current).attr("disabled", "none");
          $meta = data.split($token);
          $('.loader').hide();
          if($meta.length >1)
            $("form").submit();
          else alert("wrong!");
        },
        error: function() {
          $('.loader').hide();
          $($current).attr("disabled", "none");
          alert("wrong!");
        }
      });
  });
});
