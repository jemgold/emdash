App = require 'app'
Post = require 'models/Post'

PostEditRoute = Em.Route.extend
  model: (params) ->
    @modelFor('post')

module.exports = PostEditRoute