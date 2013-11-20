$(function() {
  $("#form-find-feed").submit(function() {
    return $("#title").val() != "";
  });
});