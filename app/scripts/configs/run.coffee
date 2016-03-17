app.run ($rootScope, PageFactory, GithubFactory, apiHost, gitHubApiHost) ->
  GithubFactory.setGitHubApi(gitHubApiHost)
  $rootScope.Page = PageFactory

  console.log 'Connected to api host: ' + apiHost

  # Set title page.
  # Get from route param title.
  $rootScope.$on '$routeChangeSuccess', (e, nextRoute) ->
    if nextRoute.title
      PageFactory.setTitle(nextRoute.title)
