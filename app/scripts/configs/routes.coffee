app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/users.html'
      controller: 'UsersCtrl'
      title: 'Welcome'
    .when '/user/:userName',
      templateUrl: 'views/user.html',
      controller: 'UserCtrl',
      title: 'Users'
    .otherwise
      redirectTo: '/'
