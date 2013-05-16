class App.Views.Index extends Backbone.View
  template: template("index")

  events:
    "click button": "saveData"

  render: ->
    @$el.html @template(@)
    @

  saveData: ->
    App.mixpanelToken = $('input.mixpanel-token').val()

class App.Views.Dashboard extends Backbone.View
  render: ->
    # @$el.html @template(@)
    @

