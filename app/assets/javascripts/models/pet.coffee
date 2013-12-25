Poochpapa.Pet = DS.Model.extend
  name: DS.attr 'string'
  age: DS.attr 'number'
  animalType: DS.attr 'string'
  breed: DS.attr 'string'
  medicalHistory: DS.attr 'string'
  specialNeeds: DS.attr 'string'
  instructions: DS.attr 'string'
  client: DS.belongsTo 'client', { async: true }
  param: DS.attr 'string'
