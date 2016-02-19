// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var currentGame = new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager);
  var gameId = window.location.search.slice(5);

  $('#save_game').click(function() {
    var postUrl = "http://localhost:3000/games";
    var gameData = currentGame.storageManager.storage.gameState;
    $.ajax({
      method: "POST",
      url: postUrl,
      data: JSON.parse(gameData)
    })
      .done(function() {
        $('.save-notification').show().delay(3000).fadeOut();
      })
      .fail(function() {
      });
  });

  if (gameId.length > 0) {
    var getUrl = "http://localhost:3000/games/" + gameId;
    $.ajax(getUrl)
      .done(function(data) {
        currentGame.loadGame(data);
    });
  }

});
