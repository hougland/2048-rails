// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var currentGame = new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager);

  $('#save_game').click(function() {
    var postUrl = "http://localhost:3000/games";
    var gameData = currentGame.storageManager.storage.gameState;
    $.ajax({
      method: "POST",
      url: postUrl,
      data: JSON.parse(gameData)
    })
      .done(function() {
        console.log("success");
      })
      .fail(function() {
        console.log("failure");
      });
  });

  $('#load-game').click(function() {
    var getUrl = "http://localhost:3000/games/1";

    $.ajax(getUrl)
      .done(function(data) {
        currentGame.loadGame(data);
    });
  });

  // $('.resume-game').click(function() {
  //   var gameId = this.attr(data-val);
  //   console.log(gameId);
  //   var getUrl = "http://localhost:3000/games/" + gameId;
  //
  //   window.location.href = 'http://localhost:3000/';
  //
  //   $.ajax(getUrl)
  //     .done(function(data) {
  //       currentGame.loadGame(data);
  //   });
  //
  // });

});
