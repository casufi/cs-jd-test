app.controller 'RepoCtrl', ($routeParams, GithubFactory) ->
  repoid = $routeParams.repoId
  return this
