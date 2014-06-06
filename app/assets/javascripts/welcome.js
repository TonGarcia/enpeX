// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

enpeXApp.controller('HomeController', function ($scope, $http) {
    // The HomeController (control all the home/landing)
    $scope.progressed_sample = "0%";
    $scope.progressed_sample = "80%";

    $scope.register = function($event) {
        // Prevent form submission before validate it
        $event.preventDefault();
    };

    $scope.login = function($event) {
        // Prevent form submission before validate it
        $event.preventDefault();
    };

    $scope.search = function() {

    };
});