Poochpapa.Role = DS.Model.extend
  user: DS.belongsTo 'user', {async: true}
  firstName: DS.attr 'string'
  lastName: DS.attr 'string'
  fullName: (->
    firstName = this.get('firstName')
    lastName = this.get('lastName')

    if !firstName and !lastName
      if Ember.isNone(this.get('id'))
        '(New Contact)'
      else
        '(No Name)'

    firstName = '' if firstName is undefined
    lastName = '' if lastName is undefined

    firstName + ' ' + lastName
  ).property('firstName', 'lastName')

Poochpapa.Admin = Poochpapa.Role.extend({})

Poochpapa.Client = Poochpapa.Role.extend
  streetAddress1: DS.attr 'string'
  streetAddress2: DS.attr 'string'
  city: DS.attr 'string'
  state: DS.attr 'string'
  zip: DS.attr 'string'
  specialInstructions: DS.attr 'string'
  phoneNumber: DS.attr 'string'
  param: DS.attr 'string'
  pets: DS.hasMany 'pet', {async: true}

