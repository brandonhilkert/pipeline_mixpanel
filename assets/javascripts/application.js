//= require ./vendor/jquery-2.0.0.min
//= require ./vendor/underscore.min
//= require ./vendor/backbone.min
//= require ./vendor/handlebars

//= require ./app
//= require ./models
//= require ./views
//= require ./router

$(function() {
  App.router = new App.Router();
  Backbone.history.start();
});
