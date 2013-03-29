# ===== Namespace =====
App = window.App = require 'app'

# ===== Store =====
App.Store = DS.Store.extend
  revision: 12
  adapter: DS.LSAdapter.create()

# ===== Templates =====
require 'templates/application'
require 'templates/index'
require 'templates/posts'
require 'templates/post'
require 'templates/edit_post'


# ===== Models =====
require 'models/Post'

# ===== Controllers =====
App.PostsController = require 'controllers/PostsController'
App.PostController = require 'controllers/PostController'
App.EditPostController = require 'controllers/EditPostController'
App.NewPostController = require 'controllers/NewPostController'

# ===== Views =====


# ===== Handlebars Helpers =====


# ===== Routes =====
App.PostRoute = require 'routes/PostRoute'
App.NewPostRoute = require 'routes/NewPostRoute'

# ===== Router =====
App.Router.map ->
  @resource('posts')
  @resource('post', path: '/posts/:post_id')
  @route('edit_post', path: '/posts/:post_id/edit')
  @route('new_post', path: '/posts/new')