App = require 'app'

PostController = Em.ObjectController.extend
  destroy: ->
    return unless confirm('Are you sure?')
    @get('model').deleteRecord()
    @get('store').commit()
    @get('target').transitionTo('posts')

  readingTime:(->
    words = @get('body').split(' ').length
    console.log words
    WPM = 200
    seconds = parseInt(words / (WPM / 60), 10)
    d = moment.duration(seconds, 'seconds')
    d.humanize()

  ).property('body')

module.exports = PostController