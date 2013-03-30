# ===== Namespace =====
App = require 'app'

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

App.Post.FIXTURES = [
  id: 1
  title: 'Something'
  updatedAt: new Date()
  body: "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?

    My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?

    Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house, fuckin' up the way the nigger talks. Motherfucker do that shit to me, he better paralyze my ass, 'cause I'll kill the motherfucker, know what I'm sayin'?"
]

# ===== Controllers =====
App.PostsController = require 'controllers/PostsController'
App.PostController = require 'controllers/PostController'
App.EditPostController = require 'controllers/EditPostController'
App.NewPostController = require 'controllers/NewPostController'

# ===== Views =====


# ===== Handlebars Helpers =====
showdown = new Showdown.converter()

Em.Handlebars.registerBoundHelper 'date', (date) ->
  moment(date).fromNow()

Em.Handlebars.registerBoundHelper 'md', (value) ->
  new Em.Handlebars.SafeString(showdown.makeHtml(value))

# ===== Routes =====
App.PostsRoute = require 'routes/PostsRoute'
App.NewPostRoute = require 'routes/NewPostRoute'

# ===== Router =====
App.Router.map ->
  @resource('posts')
  @resource('post', path: '/posts/:post_id')
  @route('edit_post', path: '/posts/:post_id/edit')
  @route('new_post', path: '/posts/new')