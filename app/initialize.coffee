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
App.IndexRoute = Ember.Route.extend
    setupController: (controller) ->
        controller.set 'content', ['red', 'yellow', 'blue']


# ===== Router =====
