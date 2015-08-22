var Gofl = Gofl || {};
Gofl.BoardDisplay = function(selector) {
  var _this = this;

  var output = document.querySelector(selector);

  var boardMaker = new Gofl.BoardMaker();

  _this.board = [];
  _this.allowClick = true;
  _this.setBoard = function(board) {
    if(board.length === _this.board.length && board[0].length === _this.board[0].length) {
      for(var i=0;i<board.length;i++) {
        _this.board[i] = _this.board[i] || [];
        for(var j=0;j<board[0].length;j++) {
          _this.board[i][j] = board[i][j];
        }
      }
    } else {
      _this.board = board;
    }
    displayBoard();
  }

  function displayBoard() {
    var renderedRows = output.getElementsByClassName('cell-row');
    var colLength = renderedRows.length;
    var rowLength = (renderedRows[0] || []).length;
    if(!(colLength === _this.board.length && rowLength === _this.board[0].length)) {
      output.innerHTML = '';
      for(var i=0,len=_this.board.length;i<len;i++) {
        output.innerHTML += '<div class="cell-row"></div>';
        var rows = output.getElementsByClassName('cell-row');
        var row = rows[rows.length - 1];
        for(var j=0;j<_this.board[i].length;j++) {
          row.innerHTML += '<div class="cell"></div>'
        }
      }
      var cells = document.getElementsByClassName('cell');
      for(var i=0;i<cells.length;i++) {
        cells[i].addEventListener('click', function() {
          if(_this.allowClick) {
            this.classList.toggle('alive');
            recalculateBoard();
          }
        });
      }
    }
    var rows = output.getElementsByClassName('cell-row');
    for(var i=0;i<rows.length;i++) {
      var row = rows[i];
      var cells = row.getElementsByClassName('cell');
      for(var j=0;j<cells.length;j++) {
        if(_this.board[i][j]) {
          cells[j].classList.add('alive');
        } else {
          cells[j].classList.remove('alive');
        }
      }
    }
  }

  function recalculateBoard() {
    var rows = output.getElementsByClassName('cell-row');
    for(var i=0;i<rows.length;i++) {
      var row = rows[i];
      var cells = row.getElementsByClassName('cell');
      for(var j=0;j<cells.length;j++) {
        _this.board[i][j] = cells[j].classList.contains('alive');
      }
    }
  }

  function aliveClass(cell) {
    if(cell) {
      return ' alive';
    } else {
      return '';
    }
  }
}
