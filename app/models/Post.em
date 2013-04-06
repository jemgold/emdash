# Post = ParseModel.extend
#   parseType: 'Post'
#   title: DS.attr('string')
#   author: DS.attr('string')
#   updatedAt: DS.attr('date')
#   body: DS.attr('string')

class Post extends DS.Model
  title: DS.attr('string')
  author: DS.attr('string')
  updatedAt: DS.attr('date')
  body: DS.attr('string')

module.exports = Post