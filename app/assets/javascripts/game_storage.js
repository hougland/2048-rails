$(document).on('ready', function() {
  $('#save_game').click(function() {
    var postUrl = "http://localhost:3000/games";
    $.ajax({
      method: "POST",
      url: postUrl,
      data: {"grid":{"size":4,"cells":[[null,null,null,null],[null,null,null,null],[null,null,{"position":{"x":2,"y":2},"value":2},{"position":{"x":2,"y":3},"value":4}],[null,{"position":{"x":3,"y":1},"value":4},{"position":{"x":3,"y":2},"value":8},{"position":{"x":3,"y":3},"value":16}]]},"score":68,"over":false,"won":false,"keepPlaying":false}
    })
      .done(function() {
        console.log("success");
      })
      .fail(function() {
        console.log("failure");
      });
  });
});
