document.addEventListener('page:change', function() {
  (function() {
    var runBtn = document.getElementById('run');
    var stopBtn = document.getElementById('stop');
    var resetBtn = document.getElementById('reset');
    var setBoardBtn = document.getElementById('set-board');
    var xInput = document.getElementById('x');
    var yInput = document.getElementById('y');

    var display = new Gofl.BoardDisplay('#gofl');
    var boardMaker = new Gofl.BoardMaker();

    var running = false;
    var runner = null;
    var runInterval = null;

    runBtn.addEventListener('click', function(e) {
      e.preventDefault();
      if(!running) {
        running = true;
        runner = new Gofl.Runner(display.board);
        runInterval = setInterval(function() {
          display.setBoard(runner.nextStep());
        }, 250);
      }
    });

    stopBtn.addEventListener('click', function(e) {
      e.preventDefault();
      running = false;
      clearInterval(runInterval);
    });

    resetBtn.addEventListener('click', function(e) {
      e.preventDefault();
      if(!running && runner) {
        display.setBoard(runner.startingBoard);
      }
    });

    setBoardBtn.addEventListener('click', function() {
      var x = xInput.value;
      var y = yInput.value;
      if(!running) {
        runner = null;
        var board = boardMaker.sizeBoard(x,y);
        display.setBoard(board);
      }
    });
  })();
});
