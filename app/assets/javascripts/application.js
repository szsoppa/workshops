//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap

$( document ).ready(function() {
  var height = $("nav").height();
  $('body').css("padding-top",height.toString());
});
