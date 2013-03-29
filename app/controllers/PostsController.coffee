App = require 'app'

PostsController = Em.ArrayController.extend
  destroy: (post) ->
    return unless confirm('Are you sure?')
    post.deleteRecord()
    @get('store').commit()
    @get('target').transitionTo('posts')

module.exports = PostsController