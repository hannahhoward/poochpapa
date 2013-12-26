Poochpapa.PetsRoute = Em.Route.extend
  authRedirectable: true

Poochpapa.PetsIndexRoute = Em.Route.extend
  model: ->
    @store.findQuery 'pet'

Poochpapa.PetsShowRoute = Em.Route.extend
  serialize: (model) ->
    pet_id: model.get 'param'

Poochpapa.PetsEditRoute = Em.Route.extend
  serialize: (model) ->
    pet_id: model.get 'param'

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('currentClient', model.get('client'))
    @store.findQuery('client').then(
      (clients) ->
        controller.set('clients', clients)
    )

Poochpapa.PetsNewRoute = Em.Route.extend
  setupController: (controller, model) ->
    controller.set('model', model)
    @store.findQuery('client').then(
      (clients) ->
        controller.set('currentClient', clients.get('content')[0])
        controller.set('clients', clients)
    )