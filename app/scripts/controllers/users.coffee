app.controller 'UsersCtrl', ($scope, GithubFactory) ->
  users_ = GithubFactory.getGithubUsersСached()
  @users =[]
  console.log({"gfusers promise":users_})
  users_
  .then (data) =>
    @users = data
    console.log({"scp users":$scope.users})
    undefined
  , (err) ->
    @errmsg = err
    undefined
  return this
