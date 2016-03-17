app.controller 'UsersCtrl', ($scope, GithubFactory) ->
  console.log(GithubFactory.getGithubUsersСached())
  undefined
  users = GithubFactory.getGithubUsersСached()

  users
  .resolve (data) ->
    $scope.users = data
    undefined
  .reject (err) ->
    $scope.errmsg = err
    undefined
  undefined
