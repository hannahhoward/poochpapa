if (typeof API_SERVER != 'undefined' && API_SERVER != "")
  Poochpapa.Router.reopen
    rootUrl: '/android_asset/www/'
else
  Poochpapa.Router.reopen
    location: 'history'

Poochpapa.Router.map ->
  @resource 'pets', ->
    @route 'show', { path: '/:pet_id' }
  @resource 'users', ->
    @route 'show', { path: '/:user_id' }
  @resource 'clients', ->
    @route 'show', { path: '/:client_id' }
    @route 'edit', { path: '/:client_id/edit' }
    @route 'new', { path: '/new' }
    return
  @route 'sign-in'