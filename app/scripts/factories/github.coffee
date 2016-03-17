app.factory 'GithubFactory', ($http, $q) ->
  githubapipath = ''
  githubusers = []

  @setGitHubApi = (githubapipath_) -> githubapipath = githubapipath_

  @getGitHubApiPath = -> githubapipath

  @getGithubUsersСached = ->
    $q (resolve, reject) ->
      if githubusers && githubusers.length
        resolve(githubusers)
      else
        $http.get(githubapipath+'/users')
        .then (data) ->
          console.log(data)
          githubusers = data
          resolve(data)
        , (err)->
          reject(err)

  return this
###
      else


  @getGithubUserСached = (username) ->
    deffer = $q.defer();
    for _githubuser in githubusers
      if  _githubuser.login == username
        githubuser = _githubuser

    if githubuser && githubuser.full
      deffer.resolve(githubuser)
    else
      $http.get(githubapipath+'/users/'+username)
      .then (data) ->
        data.full = 1
        console.log(data)
        if githubuser
          githubuser = data
        else
          githubusers.push(data)
        deffer.resolve(data)
      , (err) ->
        deffer.reject(err)
###

