# ===== Namespace =====
App = require 'app'


# ===== Templates =====
require 'templates/application'
require 'templates/index'
require 'templates/posts'
require 'templates/post'
require 'templates/edit_post'


# ===== Models =====
require 'models/Post'

# ===== Controllers =====


# ===== Views =====


# ===== Handlebars Helpers =====


# ===== Routes =====
require 'routes/NewPostRoute'


# ===== Router =====
App.Router.map ->
  @resource('posts')
  @resource('post', path: '/posts/:post_id')
  @route('edit_post', path: '/posts/:post_id/edit')
  @route('new_post', path: '/posts/new')
