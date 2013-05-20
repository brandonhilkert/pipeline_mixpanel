//= require_tree ./vendor

//= require "app"
//= require "models"
//= require "collections"
//= require "views"
//= require "router"

$(function() {
  Dashboard.app = new App.Router();
  Backbone.history.start();
});
