Poochpapa.FlashModel = Ember.Object.extend
  type : null
  message : null
  isAlert : Ember.computed.equal('type', 'alert')
  isSuccess : Ember.computed.equal('type', 'success')

  clear : ->
    this.update(null, null)

  update : (type, message) ->
    this.set('type', type)
    this.set('message', message)

  success : (message) ->
    this.update('success', message)

  alert : (message) ->
    this.update('alert', message)