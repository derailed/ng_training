@app = angular.module( 'brog', ['ngResource'] )

$(document).on('ready page:load', ->
  console.log "Got page load evt"
  angular.bootstrap(document, ['brog'])
)

@CommentsCtrl = ['$scope', ($scope) ->
  console.log "YO!!"
  $scope.comments_visible = false
  
  $scope.toggle_comments = ->
    $scope.comments_visible = !$scope.comments_visible
]