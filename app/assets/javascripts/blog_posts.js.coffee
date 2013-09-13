$(document).on 'ready page:load', ->
  $( '.summary' ).click ->
    id = $(this).attr( 'data-id' )
    $('ul.comments[data-id=' + id + "]" ).fadeToggle()