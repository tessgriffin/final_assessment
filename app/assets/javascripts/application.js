// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $("#completed").change(function(){
    $(".complete-tasks").toggleClass("hidden");
  });
  $("#future").change(function(){
    $(".future-tasks").toggleClass("hidden");
  });

  $("input[name='sort']").change(function(){
    var input = $(this).val();
    if(input === 'due-date'){
      console.log("I'm the due date")
    }else if(input === 'title'){
      console.log($('.task').not('.hidden').first().data('title'))
    }
  });

  $('#title-search').on('keyup', function() {
    var searchTitle = this.value;

    $(".task").not(".hidden").each(function (index, task){
      $task = $(task);
      if ($task.data('title').toLowerCase().indexOf(searchTitle) !== -1) {
        $task.show();
      } else {
        $task.hide();
      }
    });
  });

  $('#start-date-search').on('keyup', function() {
    var searchStart = this.value.toLowerCase();

    $(".task").not(".hidden").each(function (index, task){
      $task = $(task);
      if ($task.data('start').toLowerCase().indexOf(searchStart) !== -1) {
        $task.show();
      } else {
        $task.hide();
      }
    });
  });

  $('#due-date-search').on('keyup', function() {
    var searchDue = this.value.toLowerCase();

    $(".task").not(".hidden").each(function (index, task){
      $task = $(task);
      if ($task.data('due').toLowerCase().indexOf(searchDue) !== -1) {
        $task.show();
      } else {
        $task.hide();
      }
    });
  });
});