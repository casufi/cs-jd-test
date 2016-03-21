app.controller 'UsersCtrl', (GithubFactory) ->
  users_ = GithubFactory.getGithubUsersСached()
  @users =[]
  users_
  .then (data) =>
    #если вернули массив юзеров у которых есть логины тогда имеет смысл его возвращать,
    #иначе нам вернули фигню
    if data[0] and data[0].login
      @users = data
    undefined
  , (err) ->
    @errmsg = err
    undefined
  return this
