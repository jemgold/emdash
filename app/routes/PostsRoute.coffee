App = require 'app'

PostsRoute = Em.Route.extend
  model: ->
    App.Post.find()

  enter: ->
    @controllerFor('posts').set('searchValue', '')

module.exports = PostsRoute