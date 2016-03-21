app.run ($rootScope, PageFactory) ->
  $rootScope.Page = PageFactory

  # Set page title.
  # Get from route param title.
  $rootScope.$on '$routeChangeSuccess', (e, nextRoute) ->
    if nextRoute.title
      PageFactory.setTitle(nextRoute.title)
    # Set page header.
    # Get from route param title.
    if nextRoute.header
      PageFactory.setHeader(nextRoute.header)

    PageFactory.setMain(nextRoute.main)
