app.controller 'UsersCtrl', ($scope, GithubFactory) ->
  console.log(GithubFactory.getGithubUsersСached())
  undefined
  users = GithubFactory.getGithubUsersСached()
  users
  .then (data) ->
    $scope.users = data
    undefined
  , (err) ->
    $scope.errmsg = err
    undefined
  undefined
