//= require ./vendor/jquery-1.8.1.min
//= require ./vendor/underscore.min
//= require ./vendor/backbone.min
//= require ./vendor/handlebars
//= require ./app
//= require ./models
//= require ./collections
//= require ./views
//= require ./routers

$(function() {
  App.router = new App.Routers.Main();
  Backbone.history.start();
});
