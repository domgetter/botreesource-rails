$(window).load(function(){
  $("ul a").mouseenter(function(){
    $(this).attr("style","color:#FFF;background-image:url('/images/menu/btnOver.jpg');");
  });
  $("ul a").mouseleave(function(){
    $(this).removeAttr("style");
  });
});

