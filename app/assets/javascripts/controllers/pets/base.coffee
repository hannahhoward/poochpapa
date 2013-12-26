Poochpapa.PetBaseController = Em.ObjectController.extend
  clients: null
  currentClient: null

  saveModel: (model) ->
    self = this
    model.save().then( ()->
      Poochpapa.get('flash').success('Pet successfully saved');
      self.transitionToRoute('pets.show', model)
      return
    , ()->
      Poochpapa.get('flash').alert('Unable to save pet!');
      self.transitionToRoute('pets.edit', model)
      return
    )