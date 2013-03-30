# App = require 'app'
Post = require('models/Post')

PostsRoute = Em.Route.extend
  model: ->
    Post.find()

module.exports = PostsRoute