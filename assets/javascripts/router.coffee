class App.Router extends Backbone.Router
  initialize: ->
    @$mainEl = $(".content")

  routes:
    "": "index"
    "dashboard": "dashboard"

  index: ->
    App.router.navigate "dashboard", trigger: true

  dashboard: ->
    stats = new App.Models.Stats()
    view = new App.Views.Dashboard model: stats
    @$mainEl.html view.render().el
    stats.fetch()

