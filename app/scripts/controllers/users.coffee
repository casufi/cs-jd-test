app.controller 'UsersCtrl', ($scope, GithubFactory) ->
  $scope.githubusers = GithubFactory.getGithubUsersСached()
