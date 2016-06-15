'use strict'

### Declare app level module which depends on filters, and services ###

app_name = "myApp"
app = angular.module app_name,
[ "ngRoute",
  "#{app_name}.filters",
  "#{app_name}.services",
  "#{app_name}.directives",
  "#{app_name}.controllers"]

app.config ['$routeProvider', ($routeProvider) ->

  $routeProvider.when '/view1',
    templateUrl: 'partials/partial1.html'
    controller: 'myCtrl1'
    controllerAs: 'vm'

  $routeProvider.when '/view2/:URL',
    templateUrl: 'partials/partial2.html'
    controller: 'myCtrl2'
    controllerAs: 'vm'

  $routeProvider.otherwise
    redirectTo: '/view1'
]

angular.bootstrap document, [app_name]