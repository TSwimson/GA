$(function() {
  var testObj   = {msg: 'Hello, world'};
  var $myTest   = HandlebarsTemplates.test(testObj);

  $('#testCon').append($myTest);
});
