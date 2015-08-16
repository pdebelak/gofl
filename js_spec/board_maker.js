describe('Gofl.BoardMaker', function() {
  var board = new Gofl.BoardMaker();

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
});
