app.controller 'UsersCtrl', (GithubFactory) ->
  users_ = GithubFactory.getGithubUsersСached()
  @users =[]
  users_
  .then (data) =>
    @users = data
    undefined
  , (err) ->
    @errmsg = err
    undefined
  return this
