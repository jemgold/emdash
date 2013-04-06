App = require 'app'
EditPostController = require 'controllers/EditPostController'
Post = require 'models/Post'

class NewPostController extends EditPostController
  destroy: ->
    return unless confirm('Are you sure?')
    @target.transitionTo('posts')

module.exports = NewPostController