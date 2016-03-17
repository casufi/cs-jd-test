app.controller 'UserCtrl', ($scope, $routeParams, GithubFactory) ->
  username = $routeParams.userName
  $scope.githubuser = GithubFactory.getGithubUserСached(username)
  .success (data)-> $scope.user = data
  .error (err) -> $scope.errmsg = err
