// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

function hideFilters(){
  $('.hide-filters').hide();
  $('.show-filters').show();
  $('.panel-body').hide();
}

function showFilters(){
  $('.hide-filters').show();
  $('.show-filters').hide();
  $('.panel-body').show();
}

// $(".list-group a.list-group-item").click(function () {
//   $('.list-group > .active').removeClass('active');
//   $(this).addClass('active');
// });
