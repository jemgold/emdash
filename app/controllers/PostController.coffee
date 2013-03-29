App = require 'app'

PostController = Em.ObjectController.extend
  destroy: ->
    return unless confirm('Are you sure?')
    @get('model').deleteRecord()
    @get('store').commit()
    @get('target').transitionTo('posts')

module.exports = PostController