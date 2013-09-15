$(document).on 'ready page:load', ->
  $( '.summary' ).click ->
    $( "ul.comments[data-id=#{$(this).attr( 'data-id' )}]" ).fadeToggle()
        
  $( 'form.new_comment' ).submit (evt)->
    evt.preventDefault()
    data = $(this).serialize();
    $.ajax( {
      url:      $(this).attr( 'action' ),
      data:     data,
      method:   'POST',
      dataType: 'JSON'
    }).done (comment)->
      content = comment.content
      $( 'ul.comments' ).prepend( 
        "<li><span class='icon-comment'></span><span> " + 
        "#{content.charAt(0).toUpperCase() + content.slice(1).toLowerCase()}</span></li>" 
      )
      field = $('textarea#appendedInputButton')
      field.val( '' )
      field.focus()
      tag_id = ".comment-count[data-id=#{comment.commentable_id}]"
      $( tag_id ).html( parseInt( $(tag_id).html() ) + 1 )
      $( '#alert-message' ).html( 
        "<strong>Success!</strong> Your comment was added, bro." )
      $( '.alert' ).removeClass( 'alert-error' ).addClass( 'alert-success').show()#.fadeOut(2000)
    .fail ( xhr, textStatus )->
      $( '#alert-message' ).html(
        "<strong>Fail!</strong> Why you suck ass, bro?" )
      $( '.alert' ).addClass( 'alert-error' ).show()#.fadeOut(2000)
      