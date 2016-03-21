app.factory 'GithubFactory', ($http, $q) ->
  githubapipath = ''
  githubusers = []

  @setGitHubApi = (githubapipath_) -> githubapipath = githubapipath_
  #@setGitHubApi = ->

  @getGitHubApiPath = -> githubapipath

  @getGithubUsersСached = ->
    $q (resolve, reject) ->
      if githubusers && githubusers.length
        resolve(githubusers)
      else
        $http.get(githubapipath+'/users')
        .then (response) ->
          if response.data && response.data.length
            githubusers = response.data
            resolve(response.data)
          else
            reject("empty data")
        , (err)->
          reject(err)

  @getGithubUserCached = (username) ->

    for _githubuser in githubusers
      if  _githubuser.login == username
        @githubuser = _githubuser

    $q (resolve, reject) =>
      if @githubuser && @githubuser.full
        console.log("ghu cached":@githubuser)
        resolve(@githubuser)
      else
        userget = $http.get(githubapipath+'/users/'+username)
        userget
        .then (response) =>
          if response.data && response.data.login
            console.log("fbd user":response.data)
            if @githubuser
              @githubuser = response.data
              console.log({"1ghusers":githubusers})
            else
              githubusers.push(response.data)
              @githubuser = response.data
              console.log({"2ghusers":githubusers})
          else
            reject("can`t get user info")
          userget
        , (err) ->
          reject(err)
        .then (response) =>
          if response && response.data && response.data.repos_url
            @userdata = response.data
#TODO: Ask if it is better to use  repos_url in this case or url from API ?
            reposget = $http.get(@userdata.repos_url)
            reposget
            .then (response) =>
              if response.data && response.data.length
                @userdata.repos = response.data
              @userdata.full = 1
              resolve(@userdata)

  @getGithubUserRepoCached = (username) ->

  return this
