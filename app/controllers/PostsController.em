App = require 'app'

class PostsController extends Em.ArrayController
  destroy: (post) ->
    return unless confirm('Are you sure?')
    post.deleteRecord()
    @store.commit()
    @target.transitionTo('posts')

  searchValue: ''

  +computed content, searchValue
  filteredContent: ->
    content = @content # so we don't override original array
    if @searchValue*.length > 0
      content = @content.filter (item, index, self) =>
        title = item.title.replace(/\s/g, '')
        searchValue = @searchValue.replace(/\s/g, '')
        re = new RegExp(".*#{searchValue}.*", "i")
        title.match(re)
    content

  findOrCreate: (value) ->
    c = @filteredContent
    target = @target
    if c.length is 0
      target.transitionTo('new_post')
    else
      m = c.objectAt(0)
      target.transitionTo('post', m)

module.exports = PostsController