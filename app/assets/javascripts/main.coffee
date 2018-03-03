loaderf = ->
  $('.long, .longpaginate .page a, .longpaginate .next a, .longpaginate .prev a, .longpaginate .last a, .longpaginate .first a').on 'click', ->
    $('#loader').modal('show')
    true
  true
dtpick = ->
  $('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})
  false
@datepicker_activation = ->
  window.datepicker_activation_by_item($(document))
  false
@datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})
  false
ready = ->
  dtpick()
  loaderf()
  false

$(document).on 'turbolinks:load', ready

