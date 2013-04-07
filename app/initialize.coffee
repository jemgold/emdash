# ===== Namespace =====
window.App = App = require 'app'

# ===== Store =====
App.Store = require 'store'

# ===== Templates =====
require 'templates/application'
require 'templates/index'
require 'templates/posts'
# require 'templates/posts/index'
require 'templates/post'
require 'templates/post/index'
require 'templates/post/edit'


# ===== Models =====
App.Post = require 'models/Post'

# ===== Controllers =====
App.PostsController = require 'controllers/PostsController'
App.PostsNewController = require 'controllers/PostsNewController'
App.PostIndexController = require 'controllers/PostIndexController'
App.PostEditController = require 'controllers/PostEditController'

# ===== Views =====
App.SearchView = require "views/SearchView"

# ===== Handlebars Helpers =====
showdown = new Showdown.converter()

Em.Handlebars.registerBoundHelper 'date', (date) ->
  moment(date).fromNow()

Em.Handlebars.registerBoundHelper 'md', (value, options) ->
  if value?
    new Em.Handlebars.SafeString(showdown.makeHtml(value))

# ===== Routes =====
App.IndexRoute = require 'routes/IndexRoute'
App.PostsRoute = require 'routes/PostsRoute'
App.PostsNewRoute = require 'routes/PostsNewRoute'
App.PostIndexRoute = require 'routes/PostIndexRoute'
App.PostEditRoute = require 'routes/PostEditRoute'

# ===== Router =====
App.Router.map ->
  @resource('posts', ->
    @route('new')
    @resource('post', path: '/:post_id', ->
      @route('edit', path: '/edit')
    )
  )