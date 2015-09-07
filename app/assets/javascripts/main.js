document.addEventListener('page:change', function() {
  (function() {
    var runBtn = document.getElementById('run');
    var stopBtn = document.getElementById('stop');
    var resetBtn = document.getElementById('reset');
    var setBoardForm = document.getElementById('resize-form');
    var newBoardForm = document.getElementById('share-board');
    var xInput = document.getElementById('x');
    var yInput = document.getElementById('y');

    var display = new Gofl.BoardDisplay('#gofl');
    var boardMaker = new Gofl.BoardMaker();
    var boardData = document.getElementById('gofl').dataset.board;
    if (boardData) {
      var loadedBoard = JSON.parse(boardData);
      display.setBoard(loadedBoard.board);
    } else {
      display.setBoard(boardMaker.sizeBoard(60,40));
    }

    var running = false;
    var runner = null;
    var runInterval = null;

    runBtn.addEventListener('click', function(e) {
      e.preventDefault();
      if(!running) {
        toggleRunning();
        runner = new Gofl.Runner(display.board);
        runInterval = setInterval(function() {
          display.setBoard(runner.nextStep());
        }, 250);
      }
    });

    stopBtn.addEventListener('click', function(e) {
      e.preventDefault();
      toggleRunning();
      clearInterval(runInterval);
    });

    resetBtn.addEventListener('click', function(e) {
      e.preventDefault();
      if(!running && runner) {
        display.setBoard(runner.startingBoard);
      }
    });

    setBoardForm.addEventListener('submit', function(e) {
      e.preventDefault();
      var x = xInput.value;
      var y = yInput.value;
      if(!running) {
        runner = null;
        var board = boardMaker.sizeBoard(x,y,display.board);
        display.setBoard(board);
      }
    });

    newBoardForm.addEventListener('submit', function(e) {
      var nameField = document.getElementById('board_name');
      for (var i=0,len=display.board.length;i<len;i++) {
        newBoardForm.innerHTML += boardField(i, display.board[i]);
      }
      newBoardForm.querySelector('.form-group').classList.remove('has-error');
      if (!nameField.value) {
        e.preventDefault();
        newBoardForm.querySelector('.form-group').classList.add('has-error');
        return false;
      }
      return true;
    });

    function boardField(num, val) {
      return '<input multiple="multiple" type="hidden" name="board[board][' + num + ']" value="' + val + '"></input>'
    }

    function toggleRunning() {
      running = !running;
      display.allowClick = !display.allowClick;
    }
  })();
});
