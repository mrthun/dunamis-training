// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  $(".profile_links").click(function(){
    $.ajax({
      url: $(this).attr("href"),
      type: 'GET',
      data: $(this).serialize(),
      dataType: 'json',
      success: function(response) {
        $("#profile").html(response.html);
      }
    });
    return false;
  });
});

