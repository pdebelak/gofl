describe('Gofl.Runner', function() {
  describe('#nextStep()', function() {
    function testNextStep(board) {
      return {
        toOutput: function(output) {
          var runner = new Gofl.Runner(board);
          expect(runner.nextStep()).toEqual(output);
        }
      }
    }
    it('leaves a dead board alone', function() {
      testNextStep([[false,false],[false,false]]).toOutput([[false,false],[false,false]]);
    });

    it('leaves a block alone', function() {
      testNextStep([[true,true],[true,true]]).toOutput([[true,true],[true,true]]);
    });

    it('kills a lone live cell', function() {
      testNextStep([[true,false],[false,false]]).toOutput([[false,false],[false,false]]);
    });

    it('does the whole shebang', function() {
      testNextStep([[false,true,false],[false,true,false],[false,true,false]]).toOutput([[false,false,false],[true, true, true],[false,false,false]]);
    });

    it('updates the board', function() {
      var board = [[false,true,false],[false,true,false],[false,true,false]];
      var runner = new Gofl.Runner(board);
      runner.nextStep();
      expect(runner.board).toEqual([[false,false,false],[true, true, true],[false,false,false]]);
    });

    it('keeps the original board', function() {
      var board = [[false,true,false],[false,true,false],[false,true,false]];
      var runner = new Gofl.Runner(board);
      runner.nextStep();
      expect(runner.startingBoard).toEqual(board);
      expect(runner.startingBoard).not.toEqual(runner.board);
    });

    it('can be run multiple times', function() {
      var board = [[false,true,false],[false,true,false],[false,true,false]];
      var runner = new Gofl.Runner(board);
      runner.nextStep();
      runner.nextStep();
      expect(runner.startingBoard).toEqual(board);
    });
  });
});
