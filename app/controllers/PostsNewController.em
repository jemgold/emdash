App = require 'app'
PostEditController = require 'controllers/PostEditController'
Post = require 'models/Post'

class PostsNewController extends PostEditController
  destroy: ->
    return unless confirm('Are you sure?')
    @target.transitionTo('posts')

module.exports = PostsNewController