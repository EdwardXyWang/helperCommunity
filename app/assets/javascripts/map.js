$(function() {
  // Add a token to the create Event form for Rails security
  var token = $('meta[name=csrf-token]').attr("content");
  $(".modal").find("#create-event").prepend(
    $('<input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value=' + token + '>')
  );


  // Dropdown menu
  $(".dropdown-item").click(function(e) {
    e.stopPropagation();
    $(this).children(".dropdown-menu").slideToggle("slow");
  });

  $(".dropdown-menu").click(function(e) {
    e.stopPropagation();
  });

  $(document).on("click", function() {
    console.log('click');
    if($(".dropdown-menu").attr("style") == "display: block;") {
      $(".dropdown-menu").slideToggle("slow");
    }
  });
});


