
$ ->
  $(document).ajaxStart ->
    $('.ajax_logo').addClass 'infinite'
    return
  $(document).ajaxStop ->
    $('.ajax_logo').removeClass 'infinite'
    return
  return
$(document).ready ->
  $('.ajax_logo').removeClass 'infinite'
  return
