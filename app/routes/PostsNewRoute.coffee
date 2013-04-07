# App = require 'app'
Post = require 'models/Post'

PostsNewRoute = Em.Route.extend
  renderTemplate: ->
    @render 'post/edit', controller: 'posts.new'

  model: ->
    m = @controllerFor('posts').get('searchValue')
    Post.createRecord(title: m)

  exit: ->
    model = @get('controller.model')
    unless model.get('isSaving')
      model.deleteRecord()

module.exports = PostsNewRoute