App = require 'app'

EditPostController = Em.ObjectController.extend
  editor: true
  save: ->
    @get('model').set('updatedAt', new Date())
    @get('store').commit()
    @redirectToModel()

  destroy: ->
    return unless confirm('Are you sure?')
    @get('model').deleteRecord()
    @get('store').commit()
    @get('target').transitionTo('posts')

  redirectToModel: ->
    router = @get('target')
    model = @get('model')
    router.transitionTo('post', model)

  bod: (->
    showdown = new Showdown.converter()
    new Em.Handlebars.SafeString(showdown.makeHtml(@get('body')))
  ).property('body')

module.exports = EditPostController