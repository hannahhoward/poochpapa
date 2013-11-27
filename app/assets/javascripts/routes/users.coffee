Poochpapa.UsersRoute = Em.Route.extend
  authRedirectable: true

Poochpapa.UsersIndexRoute = Em.Route.extend
  model: ->
    @store.findQuery 'user'

Poochpapa.UsersShowRoute = Em.Route.extend
  serialize: (model) ->
    user_id: model.get 'param'