class App.Views.Dashboard extends Backbone.View
  template: template('dashboard')

  initialize: ->
    @listenTo @model, 'change', @render
    @initStatsRefresh()

  render: ->
    @$el.html @template
      stats: @model.attributes
    @

  initStatsRefresh: ->
    setInterval =>
      @model.fetch()
    , 60000

