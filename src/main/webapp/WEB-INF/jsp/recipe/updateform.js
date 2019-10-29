"use strict";

(function)

var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);

loadData(recipe.recipeNo);

function loadData() {
  $.get("/app/json/recipe/updateform?no= " + recipeNo, function(data) {
    $('#ingredient-block').html(template(data))
  });
}