Poochpapa.ClientBaseController = Em.ObjectController.extend
  saveModel: (model) ->
    self = this
    model.save().then( ()->
      Poochpapa.get('flash').success('Client successfully saved');
      self.transitionToRoute('clients.show', model)
      return
    , ()->
      Poochpapa.get('flash').alert('Unable to save client!');
      self.transitionToRoute('clients.edit', model)
      return
    )