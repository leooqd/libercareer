$(document).on 'turbolinks:load', ->
  $('.sidenav').sidenav()
  $('.sidenav-trigger').click ->
    elem = document.querySelector('#mobile-demo')
    instance = M.Sidenav.init(elem)
    instance.open()
  $('select').formSelect()
  M.updateTextFields()
  return

$(document).on 'turbolinks:before-cache', ->
  $('select').formSelect('destroy')
  M.updateTextFields()
  return
