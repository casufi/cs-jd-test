app.factory 'GithubFactory', ($http, $q) ->
  githubapipath = ''
  githubusers = []

  @setGitHubApi = (githubapipath_) -> githubapipath = githubapipath_
  #@setGitHubApi = ->

  @getGitHubApiPath = -> githubapipath

  @getGithubUsersСached = ->
    $q (resolve, reject) ->
      if githubusers && githubusers.length > 1
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
        resolve(@githubuser)
      else
        userget = $http.get(githubapipath+'/users/'+username)
        userget
        .then (response) =>
          if response.data && response.data.login
            if @githubuser
              @githubuser = response.data
            else
              githubusers.push(response.data)
              @githubuser = response.data
          else
            reject("can`t get user info")
          userget
        , (err) ->
          reject(err)
        .then (response) =>
          if response && response.data && response.data.repos_url
            @userdata = response.data
            reposget = $http.get(@userdata.repos_url)
            reposget
            .then (response) =>
              if response.data && response.data.length
                @userdata.repos = response.data
              @userdata.full = 1
              resolve(@userdata)

  @getGithubUserRepoCached = (username, reponame) ->
    # Выше пробовал использовать =>
    # Тут присвоил this переменной и все свойства присваиваю этой переменной, по мне так прозрачней
    self = this

    $q (resolve, reject) ->
      repoget = $http.get(githubapipath+'/repos/'+username+'/'+reponame)
      repoget
      .then (response) ->
        if response.data && response.data.commits_url
          self.repo = response.data
      ,(err) ->
        reject(err)
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
