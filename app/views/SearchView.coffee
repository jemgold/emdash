App = require 'app'

SearchView = Ember.TextField.extend
  insertNewline: ->
    @get('controller').send('findOrCreate', @get('value'))

module.exports = SearchView