$(document).ready(function(){
  $("#drewprechaun").hide();
  $("#princess").hide();

  $(".clover-logo").click(function(){
    $("#drewprechaun").toggle();
  });

  $(".unicorn-logo").click(function(){
    $("#princess").css('top', 300)
    $("#princess").css('left', 20)
    $("#princess").show();
    $("#princess").animate({left: window.innerWidth-500},2000);
  });

  $("#drewprechaun").hover(function(){
    var randomHeight = Math.floor(Math.random() * (window.innerHeight-160))
    var randomWidth = Math.floor(Math.random() * (window.innerWidth-100))
    $("#drewprechaun").css('top', randomHeight)
    $("#drewprechaun").css('left', randomWidth)
  });

});
