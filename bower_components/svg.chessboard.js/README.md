# svg.chessboard.js 

## Embed a chess board in your Web page using Javascript and SVG

Description of the project

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

## Dependencies
This module requires [svgjs.com](http://svgjs.com) library.

## Credits
Pieces themes and textures come from [ChessX](http://chessx.sourceforge.net)
