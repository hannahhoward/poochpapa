Poochpapa.PetsRoute = Em.Route.extend
  authRedirectable: true

Poochpapa.PetsIndexRoute = Em.Route.extend
  model: ->
    @store.findQuery 'pet'

Poochpapa.PetsShowRoute = Em.Route.extend
  serialize: (model) ->
    pet_id: model.get 'param'
