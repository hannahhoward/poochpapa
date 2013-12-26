Poochpapa.PetsNewController = Poochpapa.PetBaseController.extend
  name: null
  age: null
  animalType: null
  breed: null
  medicalHistory: null
  specialNeeds: null
  instructions: null

  actions:
    commit: (model, currentClient) ->
      model = this.store.createRecord 'pet',
        name: @name
        age: @age
        animalType: @animalType
        breed: @breed
        medicalHistory: @medicalHistory
        specialNeeds: @specialNeeds
        instructions: @instructions
        client: currentClient
      this.saveModel(model)
