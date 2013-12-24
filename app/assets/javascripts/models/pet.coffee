Poochpapa.Pet = DS.Model.extend
  name: DS.attr 'string'
  age: DS.attr 'number'
  animal_type: DS.attr 'string'
  breed: DS.attr 'string'
  medical_history: DS.attr 'string'
  special_needs: DS.attr 'string'
  instructions: DS.attr 'string'
  client: DS.belongs_to 'client', { async: true }
  param: DS.attr 'string'
