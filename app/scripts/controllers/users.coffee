app.controller 'UsersCtrl', (GithubFactory) ->

  @setImgLoaded = (user) ->
    user.imgloaded = 1

  users_ = GithubFactory.getGithubUsersСached()
  @users =[]
  users_
  .then (data) =>
    #if we get Array with the element.login property so we can use it
    #otherwise this is not users array
    if data[0] and data[0].login
      @users = data
    undefined
  , (err) ->
    @errmsg = err
    undefined
  return this
