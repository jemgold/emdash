# ===== Namespace =====
window.App = App = require 'app'

# ===== Store =====
App.Store = require 'store'

# ===== Templates =====
require 'templates/application'
require 'templates/index'
require 'templates/posts'
require 'templates/post'
require 'templates/edit_post'


# ===== Models =====
App.Post = require 'models/Post'

# ===== Controllers =====
App.PostsController = require 'controllers/PostsController'
App.PostController = require 'controllers/PostController'
App.EditPostController = require 'controllers/EditPostController'
App.NewPostController = require 'controllers/NewPostController'

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
App.NewPostRoute = require 'routes/NewPostRoute'

# ===== Router =====
App.Router.map ->
  @resource('posts')
  @resource('post', path: '/posts/:post_id')
  @route('edit_post', path: '/posts/:post_id/edit')
  @route('new_post', path: '/posts/new')