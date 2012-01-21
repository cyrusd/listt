// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {
  $(".button").button();
  $("#add_list_button").button("option", "icons", {primary: "ui-icon-plusthick"});

  $(".footer_item").hover(function () { $(this).css("background", "#dadada").css("color: #212121");}, function () { $(this).css("background", "#e1edf0").css("color", "#787878");});
  $(".footer_item").click(function () { document.location = "/" + jQuery.trim($(this).text().toLowerCase()); });

  setTimeout(function () {$("#flash_notice").fadeOut()}, 2500);
  setTimeout(function () {$("#flash_alert").fadeOut()}, 2500);
});
