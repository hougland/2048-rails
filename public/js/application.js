// Wait till the browser is ready to render the game (avoids glitches)
window.requestAnimationFrame(function () {
  var currentGame = new GameManager(4, KeyboardInputManager, HTMLActuator, LocalStorageManager);
  var gameId = window.location.search.slice(5);
  console.log(gameId);

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
        $('.save-notification').show().delay(3000).fadeOut();
      })
      .fail(function() {
        console.log("failure");
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
