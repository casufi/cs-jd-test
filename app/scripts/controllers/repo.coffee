app.controller 'RepoCtrl', ($routeParams, GithubFactory) ->
  repoowner = $routeParams.repoOwner
  reponame = $routeParams.repoName
  repo_ = GithubFactory.getGithubUserRepoCached(repoowner, reponame)
  repo_
    .then (data) =>
      @repo = data
      undefined
    , (err) ->
      @errmsg = err
      undefined
  return this

