'use strict';

module.controller('UsersCtrl', function ($scope, $http) {

    $http.get('/api/users/1')
        .success(function(data) {
            $scope.wishs = data.wishs;
        })
    ;
});
