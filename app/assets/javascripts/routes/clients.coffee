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

  actions:
    commit: (model) ->
      self = this
      model.save().then( (model)->
        Poochpapa.get('flash').success('Client successfully updated');
        self.transitionTo('clients.show', model)
      , ()->
        Poochpapa.get('flash').alert('Unable to update model');
        self.transitionTo('clients.edit', model)
      )
