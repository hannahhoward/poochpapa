#= require jquery
#= require handlebars
#= require ember
#= require ember-data

#= require ember-auth
#= require ember-auth-request-jquery
#= require ember-auth-response-json
#= require ember-auth-strategy-token
#= require ember-auth-session-cookie
#= require ember-auth-module-ember-data
#= require ember-auth-module-auth-redirectable
#= require ember-auth-module-action-redirectable
#= require ember-auth-module-rememberable

#= require_self
#= require poochpapa

# for more details see: http://emberjs.com/guides/application/
window.Poochpapa = Ember.Application.create()

#= require_tree .