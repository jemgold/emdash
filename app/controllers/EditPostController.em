App = require 'app'

class EditPostController extends Em.ObjectController
  editor: true
  save: ->
    @model.updatedAt = new Date()
    @store.commit()
    @redirectToModel()

  destroy: ->
    return unless confirm('Are you sure?')
    @model.deleteRecord()
    @store.commit()
    @target.transitionTo('posts')

  redirectToModel: ->
    @target.transitionTo('post', @model)

  +computed body
  bod: ->
    showdown = new Showdown.converter()
    new Em.Handlebars.SafeString(showdown.makeHtml(@body))

module.exports = EditPostController