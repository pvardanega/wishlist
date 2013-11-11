'use strict';

module.controller('UsersCtrl', function ($scope, $http) {

    $http.get('/api/users/1')
        .success(function(data) {
            $scope.wishs = data.wishs;
        })
    ;
});

module.controller('WishsCtrl', function ($scope, $http, $location) {

    $scope.addNew = function(wish) {
        $http.post('/api/users/1/wishs', wish)
            .success(function() {
                $location.path('/');
            })
        ;
    };
});
