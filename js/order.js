var Bakin = window.Bakin || {};

Bakin.OrderNow = (function() {
  function OrderNow() {
    this.$orderBtn = $('[data-btn-order-now]');
    this.addEventListeners();
  }

  var fn = OrderNow.prototype;

  fn.addEventListeners = function() {
    this.$orderBtn.on('click', this._displayOrder.bind(this));
  };

  fn._displayOrder = function(e) {
    e.preventDefault();
    var $link = $(e.currentTarget),
        linkParent = $link.parent(),
        orderForm = linkParent.find('[data-order-form]');

    $link.remove();
    orderForm.show("slow");
  };

  return OrderNow;
}());

new Bakin.OrderNow();
