'use strict';

var module = angular.module('wishlist', [])
    .config(function ($routeProvider, $httpProvider) {
        $httpProvider.defaults.headers.common = {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json', 'Content-Type': 'application/json'};
        
        $routeProvider
            .when('/', {
                templateUrl: 'views/users/wishs.html',
                controller: 'UsersCtrl'
            })
            .otherwise({
                redirectTo: '/'
            });
    });
