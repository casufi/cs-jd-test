app.controller 'UserCtrl', ($scope, $routeParams, GithubFactory) ->
  username = $routeParams.userName
  user_ = GithubFactory.getGithubUserCached(username)
  console.log({"gfuser promise":user_})
  user_
  .then (data) =>
    @user = data
    console.log({"scp user":@user})
    undefined
  , (err) ->
    @errmsg = err
    undefined
  return this
