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

        var register_inputs = $("#register_form input");
        var form_valid = true;

        for(input_index in register_inputs) {
            if(input_index == register_inputs.size()-1) break;

            input = $(register_inputs[input_index]);
            type = input.attr('type');
            value = input.val();
            val_length = value.length;

            if(input_index > 2) if(val_length < 3 || val_length > 55) form_valid = false;
        }

        if(form_valid) $("#register_form").submit();
        else alert("Os dados inseridos não são válidos.\nPor favor, verifique suas respostas.")
    };

    $scope.login = function($event) {
        // Prevent form submission before validate it
        $event.preventDefault();
    };

    $scope.search = function() {

    };
});