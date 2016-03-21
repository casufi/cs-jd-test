app.controller 'RepoCtrl', ($routeParams, GithubFactory) ->
  repoowner = $routeParams.repoOwner
  reponame = $routeParams.repoName
  repo_ = GithubFactory.getGithubUserRepoCached(repoowner, reponame)
  repo_
  .then (data) =>
    @repo = data
    console.log({"repo":@repo})
    undefined
  , (err) ->
    @errmsg = err
    undefined
  return this

