var Bakin = window.Bakin || {};

Bakin.Contact = (function() {
  var REGEX_TYPES = {
    'email': /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
    'text': /^[a-zA-Z ]{10,500}$/,
    'input': /^[a-zA-Z ]{3,30}$/
  };

  function Contact() {
    this.$input = $('[data-input]');
    this.$submit = $('[data-btn-submit]');

    this.addEventListeners();
  }

  var fn = Contact.prototype;

  fn.addEventListeners = function() {
    this.$input.on('keyup', this._verifyInput.bind(this));
  };

  fn._verifyInput = function(e) {
    var inputTarget = $(e.currentTarget),
        message = inputTarget.val(),
        inputContainer = inputTarget.parent(),
        errorMessage = inputContainer.find('[data-input-type]'),
        inputType = errorMessage.data('input-type');

    if (this._isValid(message, inputType)) {
      $(inputContainer).attr('data-input-valid', true);
      errorMessage.hide();
    } else {
      $(inputContainer).data('data-input-valid', false);
      errorMessage.show();
    }

    this._toggleSubmitButton();
  };

  fn._toggleSubmitButton = function() {
    if(this._allFieldsValid()) {
      this.$submit.removeAttr("disabled");
    } else {
      this.$submit.attr("disabled", true);
    }
  };

  fn._allFieldsValid = function() {
    var all_fields = [];

    $('[data-input-valid]').each(function() {
      all_fields.push($(this).attr('data-input-valid'));
    });

    return all_fields.every(function(element) { return element == "true" });
  };

  fn._isValid = function(message, inputType) {
    var regex = REGEX_TYPES[inputType];

    return regex.test(message);
  };

  return Contact;
}());

new Bakin.Contact();
