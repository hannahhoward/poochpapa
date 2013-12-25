# http://emberjs.com/guides/models/using-the-store/
DS.ActiveModelAdapter.reopen
    namespace: 'api'

if (typeof API_SERVER != 'undefined' && API_SERVER != "")
  DS.ActiveModelAdapter.reopen
    host: API_SERVER

Poochpapa.Store = DS.Store.extend
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  adapter: DS.ActiveModelAdapter
