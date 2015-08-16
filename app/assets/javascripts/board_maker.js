var Gofl = Gofl || {};
Gofl.BoardMaker = function() {
  var _this = this;

  _this.sizeBoard = function(x,y) {
    var board = [];
    for(var i=0;i<y;i++) {
      var row = [];
      for(var j=0;j<x;j++) {
        row.push(false);
      }
      board.push(row);
    }
    return board;
  }
}
