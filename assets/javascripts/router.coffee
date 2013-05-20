class App.Router extends Backbone.Router
  initialize: ->
    @$mainEl = $(".content")

  routes:
    "": "index"
    "/daashboard": "dashboard"

  index: ->
    App.router.navigate "/dashboard", trigger: true

  dashboard: ->
    view = new App.Views.Dashboard()
    @$mainEl.html view.render().el

