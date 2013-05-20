class App.Views.Dashboard extends Backbone.View
  template: template('dashboard')
  render: ->
    @$el.html @template(@)
    @

