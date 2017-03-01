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
//= require bootstrap-datepicker
//= require Chart.bundle
//= require chartkick
//= require_tree .

//TODO extract to users.coffee
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

$(document).on("turbolinks:load", function() {
  $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
  });

  $(".datepicker").datepicker({
    autoclose: true,
    format: "dd/mm/yyyy",
    clearBtn: true,
    todayHighlight: true,
    todayBtn: "linked",
    weekStart: 1,
    disableTouchKeyboard: true,
  })

  $("#modal").modal({
    show: false
  })
});
