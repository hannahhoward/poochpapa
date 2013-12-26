Poochpapa.ClientsRoute = Em.Route.extend
  authRedirectable: true

Poochpapa.ClientsIndexRoute = Em.Route.extend
  model: ->
    @store.findQuery 'client'

Poochpapa.ClientsShowRoute = Em.Route.extend
  serialize: (model) ->
    client_id: model.get 'param'


Poochpapa.ClientsEditRoute = Em.Route.extend
  serialize: (model) ->
    client_id: model.get 'param'