App = require 'app'

App.Post = DS.Model.extend
  title: DS.attr('string')
  author: DS.attr('string')
  updatedAt: DS.attr('string')
  body: DS.attr('string')