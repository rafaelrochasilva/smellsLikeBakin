var Bakin = window.Bakin || {};

$(document).on('turbolinks:load', function() {
  new Bakin.Contact();
  new Bakin.OrderNow();
  new Bakin.ResponsivePage();
});
