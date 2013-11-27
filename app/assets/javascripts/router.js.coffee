Poochpapa.Router.reopen
  location: 'history'

Poochpapa.Router.map ->
  @resource 'pets', ->
    @route 'show', { path: '/:pet_id' }
  @resource 'users', ->
    @route 'show', { path: '/:user_id' }
  @route 'sign-in'