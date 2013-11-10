'use strict';

module.controller('DefaultCtrl', function ($scope, $http) {

    $http.get('/api/')
        .success(function(data) {
            $scope.message = data.message;
        })
    ;
});
