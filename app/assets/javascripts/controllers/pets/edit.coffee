Poochpapa.PetsEditController = Poochpapa.PetBaseController.extend
  actions:
    commit: (model, currentClient) ->
      model.set('client', currentClient)
      this.saveModel(model)
