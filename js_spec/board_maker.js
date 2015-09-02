describe('Gofl.BoardMaker', function() {
  var board = new Gofl.BoardMaker();
  var currentBoard;

  beforeEach(function() {
    currentBoard = [[false,true,false],[false,true,false],[false,true,false]];
  });

  describe('#sizeBoard(x,y)', function() {
    it('has an empty array with two zeros', function() {
      expect(board.sizeBoard(0,0)).toEqual([]);
    });

    it('makes an array with one item for 1,1', function() {
      expect(board.sizeBoard(1,1)).toEqual([[false]]);
    });

    it('can make an odd sized array', function() {
      expect(board.sizeBoard(2,1)).toEqual([[false, false]]);
    });

    it('can make an arbitrarily sized array', function() {
      expect(board.sizeBoard(3,4)).toEqual([[false, false, false],[false, false, false],[false, false, false],[false, false, false]]);
    });
  });

  describe('#sizeBoard(x,y,board)', function() {
    it('keeps the board cells intact', function() {
      expect(board.sizeBoard(3,3,currentBoard)).toEqual(currentBoard);
    });

    it('makes the board the correct size', function() {
      var newBoard = board.sizeBoard(5,5,currentBoard);
      expect(newBoard.length).toEqual(5);
      expect(newBoard[0].length).toEqual(5);
    });

    it('adds around the edges', function() {
      expect(board.sizeBoard(5,5,currentBoard)).toEqual([[false,false,false,false,false],[false,false,true,false,false],[false,false,true,false,false],[false,false,true,false,false],[false,false,false,false,false]]);
    });

    it('can add assymetrically', function() {
      expect(board.sizeBoard(4,5,currentBoard)).toEqual([[false,false,false,false],[false,true,false,false],[false,true,false,false],[false,true,false,false],[false,false,false,false]]);
    });

    it('can reduce the size', function() {
      var newBoard = board.sizeBoard(5,5,currentBoard);
      expect(board.sizeBoard(3,3,newBoard)).toEqual([[false,true,false],[false,true,false],[false,true,false]]);
    });

    it('can reduce the size assymetrically', function() {
      expect(board.sizeBoard(2,2,currentBoard)).toEqual([[true,false],[true,false]]);
    });
  });
});
