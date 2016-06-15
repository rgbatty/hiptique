$(document).ready(function(){
  var scroll_pos = 0;
  $(document).scroll(function() {
      scroll_pos = $(this).scrollTop();
      if(scroll_pos > 290) {
          $("#main-navbar").css('background-color', 'black');
          $("#category-nav").removeClass("navbar-fluid-top");
          $("#category-nav").addClass("navbar-fixed-top");
          $("#category-nav").addClass("fix-category-nav");
      } else {
          $("#main-navbar").css('background-color', 'transparent');
          $("#category-nav").removeClass("navbar-fixed-top");
          $("#category-nav").addClass("navbar-fluid-top");
          $("#category-nav").removeClass("fix-category-nav");
      }
  });

  var wrap = $("#category-nav");

  wrap.on("scroll", function(e) {
    if (this.scrollTop > 147) {

      wrap.addClass("navbar-fixed-top");
      wrap.addClass("fix-category-nav");
    } else {
      wrap.removeClass("fix-category-nav");
    }
  });
});
