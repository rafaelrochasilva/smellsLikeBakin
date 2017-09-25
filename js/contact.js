var $submit = $(".submit input");
var $required = $(".required");

function containsBlanks(){
  var blanks = $required.map(function(){ return $(this).val() == "";});
  return $.inArray(true,blanks) != -1;
}

function isValidEmail(email){
  return email.indexOf("@") != -1;
}

function requiredFilledIn(){
  if(containsBlanks() || !isValidEmail($("#email").val())){
    $submit.attr("disable", "disabled");
  }else
  {
    $submit.removeAttr("disable");
  }
}

$(".mail-form span").hide();
$("input, textarea").focus(function(){
  $(this).next().fadeIn("slow");
}).blur(function(){
  $(this).next().fadeOut("slow");
}).keyup(function(){
  //Check all required fields.
});

$("#email").keyup(function(){
  if(isValidEmail($(this).val()))
    $(this).next().removeClass("error").addClass("valid");
  else
    $(this).next().removeClass("valid").addClass("error");
});

requiredFilledIn();
