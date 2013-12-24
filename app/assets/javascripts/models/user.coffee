Poochpapa.User = DS.Model.extend
  email: DS.attr 'string'
  role: DS.belongsTo 'role', { polymorphic: true, async: true, inverse: 'role' }
  param: DS.attr 'string'