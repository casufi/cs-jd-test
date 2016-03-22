app.controller 'UserCtrl', ($routeParams, GithubSvc) ->
  username = $routeParams.userName
  user_ = GithubSvc.getGithubUserCached(username)
  user_
  .then (data) =>
    @user = data
    undefined
  , (err) ->
    @errmsg = err
    undefined
  return this
