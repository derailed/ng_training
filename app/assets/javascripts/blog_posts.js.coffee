$(document).on 'ready page:load', ->
  $( '.summary' ).click ->
    $( "ul.comments[data-id=#{$(this).attr( 'data-id' )}]" ).fadeToggle()
    
  $( 'form.new_comment' ).submit (evt)->
    evt.preventDefault()
    data = $(this).serialize();
    $.ajax( {
      url:      $(this).attr( 'action' ),
      data:     data,
      dataType: 'JSON',
      method:   'POST'
    }).success (comment)->
      $( 'ul.comments' ).prepend( 
        "<li><span class='icon-comment'></span><span> #{comment.content}</span></li>" 
      )
      field = $('textarea#appendedInputButton')
      field.val( '' )
      field.focus()
      tag_id = ".comment-count[data-id=#{comment.blog_post_id}]"
      $( tag_id ).html( parseInt( $(tag_id).html() ) + 1 )