# ===== Namespace =====
App = require 'app'


# ===== Templates =====
require 'templates/application'
require 'templates/index'


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
