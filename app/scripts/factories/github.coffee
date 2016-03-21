app.factory 'GithubFactory', ($http, $q, gitHubApiHost) ->
  githubapipath = gitHubApiHost
  githubusers = []

  @getGitHubApiPath = -> githubapipath

  @getGithubUsersСached = ->
    return $q (resolve, reject) ->
      if githubusers && githubusers.length > 1
        return resolve(githubusers)

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
    self = this
    for _githubuser in githubusers
      if  _githubuser.login == username
        self.githubuser = _githubuser

    return $q (resolve, reject) ->
      if self.githubuser && self.githubuser.full
        resolve(self.githubuser)
        return undefined

      userget = $http.get(githubapipath+'/users/'+username)
      userget
        .then (response) ->
          if response.data && response.data.login
            if self.githubuser
              self.githubuser = response.data
            else
              githubusers.push(response.data)
              self.githubuser = response.data
            return userget
          reject
        , -> reject
        .then (response) ->
          if response && response.data && response.data.repos_url
            userdata = response.data
            reposget = $http.get(userdata.repos_url)
            reposget
              .then (response) ->
                if response.data && response.data.length
                  userdata.repos = response.data
                userdata.full = 1
                resolve(userdata)

  @getGithubUserRepoCached = (username, reponame) ->
    self = this
    return $q (resolve, reject) ->
      repoget = $http.get(githubapipath+'/repos/'+username+'/'+reponame)
      repoget
      .then (response) ->
        if response.data && response.data.commits_url
          self.repo = response.data
        return repoget
      , -> reject
      .then ->
          if self.repo && self.repo.commits_url
            commitsget = $http.get(githubapipath+'/repos/'+username+'/'+reponame+'/commits')
            commitsget
            .then (response) ->
              # Я проверяю действительно ли мне отдали массив коммитов
              # Посоветоваться целесообразнали такая проверка
              if response && response.data && response.data[0] && response.data[0].sha
                self.repo.commits = response.data
              resolve(self.repo)
  return this
