App = require 'app'

PostsController = Em.ArrayController.extend
  destroy: (post) ->
    return unless confirm('Are you sure?')
    post.deleteRecord()
    @get('store').commit()
    @get('target').transitionTo('posts')

  searchValue: ''

  filteredContent: (->
    content = @get('content')
    searchValue = @get('searchValue')
    if searchValue.length > 0
      content = content.filter (item, index, self) ->
        title = item.get('title')
        re = new RegExp(".*#{searchValue}.*", "i")
        title.match(re)
    content
  ).property('content', 'searchValue')

  findOrCreate: (value) ->
    c = @get('filteredContent')
    target = @get('target')
    if c.length is 0
      target.transitionTo('new_post')
    else
      m = c.objectAt(0)
      target.transitionTo('post', m)

module.exports = PostsController