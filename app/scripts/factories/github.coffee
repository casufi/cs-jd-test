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
        .then (response) ->
          if response.data && response.data.length
            console.log({"fbr data":response.data})
            githubusers = response.data
            resolve(response.data)
          else
            reject("empty data")
        , (err)->
          reject(err)

  @getGithubUserCached = (username) ->
    console.log({"started gh-user":githubusers})
    for _githubuser in githubusers
      if  _githubuser.login == username
        @githubuser = _githubuser
    $q (resolve, reject) =>
      if @githubuser && @githubuser.full
        console.log("ghu cached":@githubuser)
        resolve(@githubuser)
      else
        $http.get(githubapipath+'/users/'+username)
        .then (response) =>
          console.log({"gh response":response.data})
          if response.data && response.data.login
            response.data.full = 1
            console.log("fbd user":response.data)
            if @githubuser
              @githubuser = response.data
              console.log({"1ghusers":githubusers})
            else
              githubusers.push(response.data)
              console.log({"2ghusers":githubusers})
            resolve(response.data)
          else
            reject("can`t get user info")
        , (err) ->
          reject(err)

  return this
