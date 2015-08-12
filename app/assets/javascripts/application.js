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
  $(".toggle-status").on("click", function(){
    var id = $(this).data('id');
    $.ajax({
      url: "/task/" + id + "/update",
      type: "put"
    });
  });

  $(".delete-image").on("click", function(){
    var id = $(this).data('id');
    $.ajax({
      url: "/task/" + id + "/delete_image",
      type: "put"
    });
  });
  $("#completed").on("click", function(){
    $(".complete-tasks").toggleClass("hidden");
  });
  $("#future").on("click", function(){
    $(".future-tasks").toggleClass("hidden");
  });

  $("#title-sort").on("click", function(){
    var list = $("#all-tasks");
    var elements = $(".task").not(".hidden");
    $(elements).each(function(){
        $(this).remove();
      });
    var ordered = elements.sort(sortTitles);
    $(ordered).each(function(){
      $(list).append($(this))
    })
  })

  $("#due-date-sort").on("click", function(){
    var list = $("#all-tasks");
    var elements = $(".task").not(".hidden");
    $(elements).each(function(){
        $(this).remove();
      });
    var ordered = elements.sort(sortDueDate);
    $(ordered).each(function(){
      $(list).append($(this))
    })
  })

  function sortTitles(a, b){
    if($($(a)[0]).data('title') > $($(b)[0]).data('title')){
      return 1;
    }
    if($($(a)[0]).data('title') < $($(b)[0]).data('title')){
      return -1;
    } else {
      return 0;
    }
  }

  function sortDueDate(a, b){
    if($($(a)[0]).data('due') > $($(b)[0]).data('due')){
      return 1;
    }
    if($($(a)[0]).data('due') < $($(b)[0]).data('due')){
      return -1;
    } else {
      return 0;
    }
  }  

  $('#title-search').on('keyup', function() {
    var searchTitle = this.value.toLowerCase();

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