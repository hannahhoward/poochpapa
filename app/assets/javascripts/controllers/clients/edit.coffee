Poochpapa.ClientEditController = Poochpapa.ClientBaseController.extend
  email: (->
    if this.model.get('user')?
      this.model.get('user').get('email')
    else
      'n/a'
  ).property('user.email')

  actions:
    commit: (model) ->
      this.saveModel(model)
