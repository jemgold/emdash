App = require 'app'

PostIndexRoute = Em.Route.extend
  model: (params) ->
    @modelFor('post')

module.exports = PostIndexRoute