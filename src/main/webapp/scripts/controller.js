'use strict';

module.controller('WishListCtrl', function ($scope, $http) {

    $http.get('/api/users/1/wishlist')
        .success(function(data) {
            console.log(data);
            $scope.wishlist = data;
        })
    ;
});
