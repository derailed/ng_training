@app = angular.module( 'brog', ['ngResource'] )

$(document).on('ready page:load', ->
  angular.bootstrap(document, ['brog'])
)

@CommentsCtrl = ['$scope', ($scope) ->
  $scope.comments_visible = false
  
  $scope.toggle_comments = ->
    $scope.comments_visible = !$scope.comments_visible
]
