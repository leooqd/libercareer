$(document).on 'turbolinks:load', ->
  $('select').formSelect()
  M.updateTextFields()
  return

$(document).on 'turbolinks:before-cache', ->
  $('select').formSelect('destroy')
  M.updateTextFields()
  return
