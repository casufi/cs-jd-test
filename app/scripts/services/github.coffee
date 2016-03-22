app.service 'GithubSvc', ($resource, $http, $q, gitHubApiHost) ->
  githubapipath = gitHubApiHost
  githubusers = []

  Users = $resource githubapipath+'/users'
  User = $resource githubapipath+'/users/:userName'
  Repos = $resource githubapipath+'/users/:userName/repos'
  Repo = $resource githubapipath+'/repos/:userName/:repoName'
  RepoCommits = $resource githubapipath+'/repos/:userName/:repoName/commits'

  @getGitHubApiPath = -> githubapipath

  @getGithubUsersСached = ->
    return $q (resolve, reject) ->
      if githubusers && githubusers.length > 1
        return resolve(githubusers)
      Users.query()
        .$promise
        .then (users) ->
          if users? and users[0]?.login
            githubusers = users
            resolve(users)
            return this
          reject
        , -> reject

  @getGithubUserCached = (username) ->
    self = this
    for _githubuser in githubusers
      if  _githubuser.login == username
        self.githubuser = _githubuser

    return $q (resolve, reject) ->
      if self.githubuser && self.githubuser.full
        resolve(self.githubuser)
        return undefined
      User.get {userName:username}
        .$promise
        .then (user) ->
          if user and user.login
            if !self.githubuser
              githubusers.push(user)
            self.githubuser = user
            return this
          reject
        , -> reject
        .then ->
          Repos.query {userName:username}
            .$promise
            .then (repos) ->
              if repos && repos.length
                self.githubuser.repos = repos
              self.githubuser.full = 1
              resolve(self.githubuser)
            return this

  @getGithubUserRepoCached = (username, reponame) ->
    self = this
    return $q (resolve, reject) ->
      Repo.get {userName:username, repoName:reponame}
        .$promise
        .then (repo) ->
          console.log({repo})
          if repo and repo.commits_url
            self.repo = repo
            return this
          reject
        , -> reject
        .then ->
          if self.repo && self.repo.commits_url
            RepoCommits.query  {userName:username, repoName:reponame}
              .$promise
              .then (commits) ->
                if commits and commits[0] and commits[0].sha
                  self.repo.commits = commits
                resolve(self.repo)
                return this
              
  return undefined
