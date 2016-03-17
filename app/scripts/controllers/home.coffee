app.controller 'HomeCtrl', ($scope, GithubFactory) ->
  $scope.githubusers = GithubFactory.getGithubUsersСached()