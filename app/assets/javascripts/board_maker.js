var Gofl = Gofl || {};
Gofl.BoardMaker = function() {
  var _this = this;

  _this.sizeBoard = function(x,y,board) {
    if(board) {
      return changeBoard(x,y,board);
    } else {
      return blankBoard(x,y);
    }
  }

  function blankBoard(x,y) {
    var board = [];
    for(var i=0;i<y;i++) {
      var row = blankRow(x);
      board.push(row);
    }
    return board;
  }

  function changeBoard(x,y,board) {
    var currentX = board[0].length;
    var currentY = board.length;
    var ydiff = y - currentY;
    var xdiff = x - currentX;
    var beginningX = Math.floor(xdiff / 2);
    var endingX = Math.floor(xdiff / 2) + (xdiff % 2);
    var beginningY = Math.floor(ydiff / 2);
    var endingY = Math.floor(ydiff/ 2) + (ydiff % 2);
    console.log(beginningX, endingX, beginningY, endingY);
    if (beginningX > -1) {
      for(var i=0;i<currentY;i++) {
        for(var j=0;j<beginningX;j++) {
          board[i].unshift(false);
        }
      }
    } else {
      for(var i=0;i<currentY;i++) {
        for(var j=0;j<Math.abs(beginningX);j++) {
          board[i].shift();
        }
      }
    }
    if (endingX > -1) {
      for(var i=0;i<currentY;i++) {
        for(var j=0;j<endingX;j++) {
          board[i].push(false);
        }
      }
    } else {
      for(var i=0;i<currentY;i++) {
        for(var j=0;j<Math.abs(endingX);j++) {
          board[i].pop();
        }
      }
    }
    if (beginningY > -1) {
      for(var i=0;i<beginningY;i++) {
        board.unshift(blankRow(x));
      }
    } else {
      for(var i=0;i<Math.abs(beginningY);i++) {
        board.shift();
      }
    }
    if (endingY > -1) {
      for(var i=0;i<endingY;i++) {
        board.push(blankRow(x));
      }
    } else {
      for(var i=0;i<Math.abs(endingY);i++) {
        board.pop();
      }
    }
    return board;
  }

  function blankRow(length) {
    var row = [];
    for(var i=0;i<length;i++) {
      row.push(false);
    }
    return row;
  }
}
