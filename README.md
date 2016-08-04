# svg.chessboard.js 

## Embed a chess board in your Web page using Javascript and SVG

The idea of the project is to use SVG capabilities to produce a flexible chessboard with features you cannot obtain using simply HTML, such as arrow markers between two squares.

## Screenshot and demo

![Svg chess board screenshot](https://ilhooq.github.io/svgchessboard/images/Chessboard_SVG.jpg)

[Demo](https://ilhooq.github.io/svgchessboard/demo/)

[Use with chess.js library](https://ilhooq.github.io/svgchessboard/demo/chessgame.html)

## Features

* Themeable interface
* Board rotation
* Graphical annotations (square and arrows)
* Event driven behaviors

## Usage

Install the component and its dependencies:

    bower install svg.chessboard.js

Include this component after including the svg.js library and svg.draggable.js in your html document.

```html
<script src="svg.js"></script>
<script src="svg.draggable.js"></script>
<script src="svg.chessboard.js"></script>
```

Insert a board container somewhere into your document.

```html
<div id="board"></div>
```

Then initialize the board with javascript :

```javascript
var board;

window.onload = function() {
  board = new SvgChessBoard('board', {
    margin : 60,
    squareStyle : 'wood',
    pieceStyle : 'merida-outline-shadow'
  });
  board.addPiece('wKing', 'e2');
  board.addPiece('bKing', 'e7');
}
```
## API

### SvgChessBoard::addPiece(type, square)

Add a piece on the board

**type** : must be one of these values : wKink, wQueen, wRook, wKnight, wBishop, wPawn, bKink, bQueen, bRook, bKnight, bBishop, bPawn 

**square** : a square in algebraic notation like "e4" or "g6"

### SvgChessBoard::removePiece(square)

Remove a piece from the board

**square** : a square in algebraic notation like "e4" or "g6"

### SvgChessBoard::movePiece(from, to)

Move a piece on the board

**from** : a square in algebraic notation like "e4" or "g6"

**to** : a square in algebraic notation like "e4" or "g6"

### SvgChessBoard::toggleSquareColor(square, color, opacity)

Toogle square color annotation

**square** : a square in algebraic notation like "e4" or "g6"

**color** : a color in hexadecimal format like "#FF0000"

**opacity** : a number between 0 and 1 like "0.5"

### SvgChessBoard::drawArrow(fromSquare, toSquare, color, opacity)

Draw an arrow betwwen two squares

**fromSquare** : a square in algebraic notation like "e4" or "g6"

**toSquare** : a square in algebraic notation like "e4" or "g6"

**color** : a color in hexadecimal format like "#FF0000"

**opacity** : a number between 0 and 1 like "0.5"

### SvgChessBoard::rotate()

Rotate the board

### SvgChessBoard::setSquareStyle(style)

Change squares texture

**style** : an image name without extension under the path {themePath]/board/

### SvgChessBoard::setSquaresColor::(wColor, bColor)

Change squares color (remove textures)

**wColor** : White squares color in hexadecimal format like "#FF0000"

**bColor** : Black squares color in hexadecimal format like "#FF0000"

### SvgChessBoard::ssetPieceStyle::(style)

Change pieces appearence

**style** : an image name without extension under the path {themePath]/pieces/

### SvgChessBoard::on(eventName, eventListener)

Register an event listener

**eventName** : The name of the event

**eventListener** : a function

## Events

### beforedrop

This event is fired before a piece is dropped on the board and can prevent if the piece can be dropped or not after a drag.

```javascript
board.on('beforedrop', function(e) {
    // Check if we can drop a piece
    var legalMoves = position.moves({ verbose: true });
    var move = e.detail.move;
    e.detail.candrop = false;

    for (var i=0; i < legalMoves.length; i++ ) {
      if (move.from == legalMoves[i].from && move.to == legalMoves[i].to) {
        e.detail.candrop = true;
        break;
      }
    }
});
```

### afterdrop

This event is fired after a piece is dropped on the board and can be used to update the board.

```javascript
board.on('afterdrop', function(e) {
    var move = e.detail.move;

    move = position.move(move);

    switch (move.flags) {
      case 'k' : // Kingside castling
        if (move.color == 'w') {
          board.movePiece('h1', 'f1');
        } else {
          board.movePiece('h8', 'f8');
        }
        break;
        // ...
    }
});
```

## Dependencies
This module requires [svgjs.com](http://svgjs.com) library.

## Credits
Pieces themes and textures come from [ChessX](http://chessx.sourceforge.net)
