App = require 'app'
Post = require 'models/Post'

App.NewPostRoute = Em.Route.extend
  renderTemplate: ->
    @render 'edit_post', controller: 'new_post'

  model: ->
    post.createRecord()

  exit: ->
    model = @get('controller.model')
    unless model.get('isSaving')
      model.deleteRecord()