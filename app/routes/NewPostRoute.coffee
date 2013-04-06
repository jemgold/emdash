# App = require 'app'
Post = require 'models/Post'

NewPostRoute = Em.Route.extend
  renderTemplate: ->
    @render 'edit_post', controller: 'new_post'

  model: ->
    m = @controllerFor('posts').get('searchValue')
    Post.createRecord(title: m)

  exit: ->
    model = @get('controller.model')
    unless model.get('isSaving')
      model.deleteRecord()

module.exports = NewPostRoute