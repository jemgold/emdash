App = require 'app'

class PostIndexController extends Em.ObjectController
  destroy: ->
    return unless confirm('Are you sure?')
    @model.deleteRecord()
    @store.commit()
    @target.transitionTo('posts')

  +computed body
  readingTime: ->
    words = @body?.split(' ').length
    WPM = 200
    seconds = parseInt(words / (WPM / 60), 10)
    d = moment.duration(seconds, 'seconds')
    d.humanize()

module.exports = PostIndexController