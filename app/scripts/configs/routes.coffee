app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/users.html'
      controller: 'UsersCtrl as usersctl'
      title: 'Welcome'
    .when '/user/:userName',
      templateUrl: 'views/user.html',
      controller: 'UserCtrl as userctl',
      title: 'User'
    .when '/repo/:repoId',
      templateUrl: 'views/repo.html',
      controller: 'RepoCtrl as repoctl',
      title: 'Repo'
    .otherwise
      redirectTo: '/'
