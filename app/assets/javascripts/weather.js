$(document).ready(function(){
  $( ".pot-o-gold" ).on("mouseenter", function() {
    $(this).toggleClass("grow");
    $( ".grow" ).animate({ width: "150%",
                           height: "150%",
                           left: "-=50" },
                           1000 );
  });
  $( ".pot-o-gold" ).on("mouseleave", function() {
    $( ".grow" ).animate({ width: "100%",
                           height: "200px",
                           left: "+=50" },
                           1000 );
    $(this).toggleClass("grow");
  });

  $( ".sunshine" ).on("mouseenter", function() {
    $(this).toggleClass("grow");
    $( ".grow" ).animate({ width: "150%",
                           height: "150%",
                           left: "-=50" },
                           1000 );
  });
  $( ".sunshine" ).on("mouseleave", function() {
    $( ".grow" ).animate({ width: "100%",
                           height: "200px",
                           left: "+=50" },
                           1000 );
    $(this).toggleClass("grow");
  });

  $( ".leprechaun" ).on("mouseenter", function() {
    $(this).toggleClass("grow");
    $( ".grow" ).animate({ width: "150%",
                           height: "150%",
                           left: "-=50" },
                           1000 );
  });
  $( ".leprechaun" ).on("mouseleave", function() {
    $( ".grow" ).animate({ width: "100%",
                           height: "200px",
                           left: "+=50" },
                           1000 );
    $(this).toggleClass("grow");
  });
});
