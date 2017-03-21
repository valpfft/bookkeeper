ready = ->
  $('select[data-selectize]').selectize
    create: false,
$(document).ready(ready)
$(document).on("turbolinks:load", ready)
