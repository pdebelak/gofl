describe('Gofl.BoardDisplay', function() {
  var display;
  var testBoard;

  beforeAll(function() {
    var body = document.querySelector('body');
    body.innerHTML += '<div id="test-board"></div>';
    testBoard = document.getElementById('test-board');
  });

  beforeEach(function() {
    display = new Gofl.BoardDisplay('#test-board');
    display.setBoard([[false, false, false],[false, false, false],[false, false, false]]);
  });

  afterEach(function() {
    testBoard.innerHTML = '';
  });

  it('displays the board in the passed in container', function() {
    expect(document.getElementById('test-board').innerHTML.length).toBeGreaterThan(0);
  });

  it('sets a cell to alive when clicked', function() {
    var firstCell = testBoard.getElementsByClassName('cell')[0];
    firstCell.click();
    expect(firstCell.classList.contains('alive')).toBe(true);
  });

  it('sets that cell to true in the board', function() {
    var firstCell = testBoard.getElementsByClassName('cell')[0];
    firstCell.click();
    expect(display.board[0][0]).toBe(true);
  });

  it('kills a live cell that is clicked', function() {
    var firstCell = testBoard.getElementsByClassName('cell')[0];
    firstCell.click();
    firstCell.click();
    expect(firstCell.classList.contains('alive')).toBe(false);
  });

  it('can stop accepting clicks', function() {
    display.allowClick = false;
    var firstCell = testBoard.getElementsByClassName('cell')[0];
    firstCell.click();
    expect(firstCell.classList.contains('alive')).toBe(false);
  });

  describe('#setBoard(board)', function() {
    it('sets the cells that are true to alive', function() {
      display.setBoard([[true, false, false],[false, false, false],[false, false, false]]);
      var firstCell = testBoard.getElementsByClassName('cell')[0];
      expect(firstCell.classList.contains('alive')).toBe(true);
    });

    it('can reduce the size of the existing board', function() {
      display.setBoard([[false, false],[false, false]]);
      expect(display.board.length).toEqual(2);
      expect(display.board[0].length).toEqual(2);
    });
  });

});
