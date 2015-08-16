var Gofl = Gofl || {};
Gofl.Runner = function(board) {
  var _this = this;
  _this.startingBoard = cloneBoard(board);
  _this.board = cloneBoard(board);

  _this.nextStep = function() {
    var step =  mapBoard(function(rowIndex, colIndex) {
      var myLiveNeighbors = liveNeighbors(rowIndex, colIndex);
      if(myLiveNeighbors < 2) {
        return false;
      } else if(myLiveNeighbors > 3){
        return false;
      } else {
        if(myLiveNeighbors === 3) {
          return true;
        } else if(myLiveNeighbors === 2) {
          return _this.board[rowIndex][colIndex];
        }
      }
    });
    for(var i=0;i<step.length;i++) {
      _this.board[i] = _this.board[i] || [];
      for(var j=0;j<step[0].length;j++) {
        _this.board[i][j] = step[i][j];
      }
    }
    return step;
  };

  function cloneBoard(board) {
    var output = [];
    for(var i=0;i<board.length;i++) {
      output[i] = [];
      for(var j=0;j<board[0].length;j++) {
        output[i][j] = board[i][j];
      }
    }
    return output;
  }

  function mapBoard(callback) {
    var output = [];
    for(var i=0;i<_this.board.length;i++) {
      var row = [];
      for(var j=0;j<_this.board[i].length;j++) {
        row.push(callback(i, j));
      }
      output.push(row);
    }
    return output;
  }

  function liveNeighbors(rowIndex, colIndex) {
    var myNeighbors = neighbors(rowIndex, colIndex);
    var liveNeighbors = select(myNeighbors, function(cell) { return cell; });
    if(_this.board[rowIndex][colIndex]) {
      return liveNeighbors.length - 1;
    } else {
      return liveNeighbors.length;
    }
  }

  function neighbors(rowIndex, colIndex) {
    var neighbors = [];
    for(var i=rowIndex-1;i<=rowIndex+1;i++) {
      for(var j=colIndex-1;j<=colIndex+1;j++) {
        if(_this.board[i]) {
          neighbors.push(_this.board[i][j]);
        }
      }
    }
    return neighbors;
  }

  function select(collection, callback) {
    var output = [];
    each(collection, function(item) {
      if(callback(item)) {
        output.push(item);
      }
    });
    return output;
  }

  function each(collection, callback) {
    for(var i=0,len=collection.length;i<len;i++) {
      callback(collection[i]);
    }
  }
};
