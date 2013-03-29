App = require 'app'
Post = require('models/Post')

PostRoute = Em.Route.extend
  model: ->
    Post.find()

module.exports = PostRoute