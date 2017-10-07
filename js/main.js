var Bakin = window.Bakin || {};

Bakin.ResponsivePage = (function(){
  function ResponsivePage() {
    $("[data-featured-video]").fitVids();
    $("[data-fittext]").fitText(2.2);
  }

  return ResponsivePage
}());

new Bakin.ResponsivePage();
