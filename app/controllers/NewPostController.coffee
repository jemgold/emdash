App = require 'app'
EditPostController = require 'controllers/EditPostController'
Post = require 'models/Post'

NewPostController = EditPostController.extend
  destroy: ->
    return unless confirm('Are you sure?')
    @get('target').transitionTo('posts')

module.exports = NewPostController