'use strict'

### Controllers ###

app_name = "myApp"
app = angular.module "#{app_name}.controllers",
 ['ngMaterial','angular-underscore']

app.controller 'myCtrl1', ['$scope','$rootScope','$http','$location',
 ($scope,$rootScope,$http,$location) ->
    $scope.name = "view 1"
    $scope.items = ['Item 1', 'Item 2', 'Item 3']

    gold = silver = rest = "unknown"
    vm = this
    $scope.temp = "git commit test"
    # this is for testing purposes
    awardMedals = (first, second, others...) ->
        gold   = first
        silver = second
        rest   = others
    $scope.say = -> window.alert.apply window, arguments
    res = $http.get "https://api.github.com/users"
    res.then (result)->
      console.log result.data
      $scope.data = result.data
      awardMedals (result.login for result in result.data)...
    ,(error) ->
      console.log "error", error
    console.log _.every [2, 4, 6], (num) ->
          num % 2 == 0
    numbers = [10, 5, 100, 2, 1000]
    console.log _.min numbers
    console.log $scope.sample [1, 2, 3]
    console.log $scope._ [1, 2, 3]
    $scope.go = (path,user) ->
      $rootScope.USER = user
      $location.path( path )
  ]

app.controller 'myCtrl2', ['$scope','$rootScope','$http',
 ($scope,$rootScope,$http) ->
    $scope.user = $rootScope.USER
    res = $http.get $rootScope.USER.url
    res.then (result)->
      console.log result.data
      $scope.user = result.data
    ,(error) ->
      console.log "error", error
   ]