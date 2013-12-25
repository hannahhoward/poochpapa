Poochpapa.ClientsNewController = Poochpapa.ClientBaseController.extend
  firstName: null
  lastName: null
  streetAddress_1: null
  streetAddress_2: null
  city: null
  state: null
  zip: null
  specialInstructions: null
  phoneNumber: null

  actions:
    commit: () ->
      model = this.store.createRecord 'client',
          firstName: @get 'firstName'
          lastName: @get 'lastName'
          streetAddress_1: @get 'streetAddress_1'
          streetAddress_2: @get 'streetAddress_2'
          city: @get 'city'
          state: @get 'state'
          zip: @get 'zip'
          specialInstructions: @get 'specialInstructions'
          phoneNumber: @get 'phoneNumber'
      this.saveModel(model)
