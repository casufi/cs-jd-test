app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/users.html'
      controller: 'UsersCtrl as usersctl'
      title: 'Github view'
      header: 'Welcome',
      main: 1
    .when '/user/:userName',
      templateUrl: 'views/user.html',
      controller: 'UserCtrl as userctl',
      title: 'Github view',
      header: 'User page',
    .when '/repo/:repoId',
      templateUrl: 'views/repo.html',
      controller: 'RepoCtrl as repoctl',
      title: 'Github view',
      header: 'Repos page',
    .otherwise
      redirectTo: '/'
