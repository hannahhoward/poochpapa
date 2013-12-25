Poochpapa.FlashView = Ember.View.extend
  templateName : 'flash'
  classNames : [ 'alert-box' ]
  classNameBindings : [ 'success', 'alert' ]
  messageBinding : 'model.message'
  alertBinding : 'model.isAlert'
  successBinding : 'model.isSuccess'
  isEmpty : Ember.computed.empty('message')

  didInsertElement : ->
    if this.get('isEmpty')
      this.hide()

  onMessageChange : (->
    if this.get('isEmpty') then this.hide() else this.show()
  ).observes('message')

  hide : ->
    this.$().hide()

  show : ->
    this.$().show()

  click : (e) ->
    e.preventDefault()
    this.get('model').clear()
