app.factory 'GithubFactory', ($http, $q) ->
  githubapipath = ''
  githubusers = []

  @setGitHubApi = (githubapipath_) -> githubapipath = githubapipath_

  @getGitHubApiPath = -> githubapipath

  @getGithubUsersСached = ->
    deffer = $q.defer();
    if githubusers && githubusers.length
      deffer.resolve(githubusers)
    else
      $http.get(githubapipath+'/users').success (data) ->
        console.log(data)
        githubusers = data
        deffer.resolve(data)
      .error (err) ->
        console.log(err)
        []
    deffer

  return this
