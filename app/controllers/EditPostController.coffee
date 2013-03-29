App = require 'app'

EditPostController = Em.ObjectController.extend
  save: ->
    @get('store').commit()
    @redirectToModel()

  redirectToModel: ->
    router = @get('target')
    model = @get('model')
    router.transitionTo('post', model)

module.exports = EditPostController