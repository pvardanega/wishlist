'use strict';

var module = angular.module('laps', [])
    .config(function ($routeProvider, $httpProvider) {
        $httpProvider.defaults.headers.common = {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json', 'Content-Type': 'application/json'};
        
        $routeProvider
            .when('/', {
                templateUrl: 'views/default/welcome.html',
                controller: 'DefaultCtrl'
            })
            .otherwise({
                redirectTo: '/'
            });
    });
