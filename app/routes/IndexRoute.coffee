App = require 'app'

IndexRoute = Em.Route.extend
  redirect: ->
    @transitionTo('posts')

module.exports = IndexRoute