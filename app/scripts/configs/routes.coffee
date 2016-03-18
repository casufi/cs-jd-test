app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/users.html'
      controller: 'UsersCtrl as usersctl'
      title: 'Welcome'
    .when '/user/:userName',
      templateUrl: 'views/user.html',
      controller: 'UserCtrl as userctl',
      title: 'Users'
    .otherwise
      redirectTo: '/'
