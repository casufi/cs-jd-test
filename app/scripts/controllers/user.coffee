app.controller 'UserCtrl', ($routeParams, GithubFactory) ->
  username = $routeParams.userName
  user_ = GithubFactory.getGithubUserCached(username)
  user_
  .then (data) =>
    @user = data
    undefined
  , (err) ->
    @errmsg = err
    undefined
  return this
