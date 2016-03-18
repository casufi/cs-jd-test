app.controller 'ReposCtrl', ($scope, $routeParams, GithubFactory) ->
  repoid = $routeParams.repoId
  return this
