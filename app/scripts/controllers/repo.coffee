app.controller 'RepoCtrl', ($routeParams, GithubSvc) ->
  repoowner = $routeParams.repoOwner
  reponame = $routeParams.repoName
  repo_ = GithubSvc.getGithubUserRepoCached(repoowner, reponame)
  repo_
    .then (data) =>
      @repo = data
      undefined
    , (err) ->
      @errmsg = err
      undefined
  return this

