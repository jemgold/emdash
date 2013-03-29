# ===== Namespace =====
window.App = App = Em.Application.create({})

# ===== Store =====
App.Store = DS.Store.extend
  revision: 12
  adapter: DS.FixtureAdapter.extend()

# ===== Templates =====
require 'templates/application'
require 'templates/index'
require 'templates/posts'
require 'templates/post'
require 'templates/edit_post'


# ===== Models =====
App.Post = DS.Model.extend
  title: DS.attr('string')

App.Post.FIXTURES = [
  id: 1
  title: "Something"
,
  id: 2
  title: "Something123123"
]

# ===== Controllers =====
App.PostsController = Em.ArrayController.extend
  destroy: (post) ->
    return unless confirm('Are you sure?')
    post.deleteRecord()
    @get('store').commit()
    @get('target').transitionTo('posts')

App.PostController = Em.ObjectController.extend
  destroy: ->
    return unless confirm('Are you sure?')
    @get('model').deleteRecord()
    @get('store').commit()
    @get('target').transitionTo('posts')


App.EditPostController = Em.ObjectController.extend
  save: ->
    @get('store').commit()
    @redirectToModel()

  redirectToModel: ->
    router = @get('target')
    model = @get('model')
    router.transitionTo('post', model)

App.NewPostController = App.EditPostController.extend()

# ===== Views =====


# ===== Handlebars Helpers =====


# ===== Routes =====
App.PostsRoute = Em.Route.extend
  model: ->
    App.Post.find()

App.PostRoute = Em.Route.extend
  model: ->
    App.Post.find()

App.NewPostRoute = Em.Route.extend
  renderTemplate: ->
    @render 'edit_post', controller: 'new_post'

  model: ->
    App.Post.createRecord()

  exit: ->
    model = @get('controller.model')
    unless model.get('isSaving')
      model.deleteRecord()

# ===== Router =====
App.Router.map ->
  @resource('posts')
  @resource('post', path: '/posts/:post_id')
  @route('edit_post', path: '/posts/:post_id/edit')
  @route('new_post', path: '/posts/new')