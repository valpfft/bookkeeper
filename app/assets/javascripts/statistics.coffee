ready = ->
  $('#year-select').on 'change', ->
    window.location = "statistics?year=#{@.selectedOptions[0].value}"
$(document).ready(ready)
$(document).on('turbolinks:load', ready)
