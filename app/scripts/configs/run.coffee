app.run ($rootScope, PageFactory, GithubFactory, apiHost, gitHubApiHost) ->
  GithubFactory.setGitHubApi(gitHubApiHost)
  console.log 'Connected to api host: ' + gitHubApiHost
  $rootScope.Page = PageFactory
  # Set title page.
  # Get from route param title.
  $rootScope.$on '$routeChangeSuccess', (e, nextRoute) ->
    if nextRoute.title
      PageFactory.setTitle(nextRoute.title)
