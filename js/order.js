$(".order_form").hide().before("<a href='#' class='order_now'>Order Now</a>");
$(".order_now").click(function(){
  var $link = $(this);
  $link.next().show("slow").prev().remove();
  return false;
})
