Bakin.ResponsivePage = (function(){
  function ResponsivePage() {
    $("[data-featured-video]").fitVids();
    $("[data-fittext]").fitText(2.2);
  }

  return ResponsivePage;
}());
