# App = require 'app'
Post = require('models/Post')

PostsRoute = Em.Route.extend
  model: ->
    Post.find()

  enter: ->
    @controllerFor('posts').set('searchValue', '')

module.exports = PostsRoute