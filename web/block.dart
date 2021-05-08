class Point {
  int x;
  int y;

  Point(this.x, this.y);
}

abstract class Tetromino {
  static const gridWidth = 10;
  static const gridHeight = 20;

  static final _types = {
    'I': () => TetrominoI(),
    'L': () => TetrominoL(),
    'J': () => TetrominoJ(),
    'O': () => TetrominoO(),
    'T': () => TetrominoT(),
    'S': () => TetrominoS(),
    'Z': () => TetrominoZ(),
  };

  final blocks = <Point>[];

  /// Index of the block of the rotating center.
  final int center;

  final String type;

  Tetromino(this.type, this.center);

  void rotate() {
    _assign([for (var block in blocks) _rotate(block, blocks[center])]);
  }

  void move(int dx) {
    _assign([for (var block in blocks) Point(block.x + dx, block.y)]);
  }

  void _assign(Iterable<Point> points) {
    if (!_isValid(points)) return;
    blocks
      ..clear()
      ..addAll(points);
  }

  static Tetromino fromType(String type) => _types[type]();

  static Point _rotate(Point p, Point center) =>
      Point(center.y - p.y + center.x, p.x - center.x + center.y);

  static bool _isValid(List<Point> blocks) =>
      blocks.every((block) => block.x >= 0 && block.x < gridWidth) &&
      blocks.every((block) => block.y >= 0 && block.y < gridHeight);
}

class TetrominoI extends Tetromino {
  @override
  final blocks = [
    Point(
      Tetromino.gridWidth ~/ 2 - 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 2,
      2,
    ),
  ];

  TetrominoI() : super('I', 1);
}

class TetrominoL extends Tetromino {
  @override
  final blocks = [
    Point(
      Tetromino.gridWidth ~/ 2 - 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      1,
    ),
  ];

  TetrominoL() : super('L', 1);
}

class TetrominoJ extends Tetromino {
  @override
  final blocks = [
    Point(
      Tetromino.gridWidth ~/ 2 - 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      3,
    ),
  ];

  TetrominoJ() : super('J', 1);
}

class TetrominoT extends Tetromino {
  @override
  final blocks = [
    Point(
      Tetromino.gridWidth ~/ 2 - 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      3,
    ),
  ];

  TetrominoT() : super('T', 1);
}

class TetrominoO extends Tetromino {
  @override
  final blocks = [
    Point(
      Tetromino.gridWidth ~/ 2,
      3,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      3,
    ),
  ];

  TetrominoO() : super('O', 1);
}

class TetrominoS extends Tetromino {
  @override
  final blocks = [
    Point(
      Tetromino.gridWidth ~/ 2 - 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      1,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 + 1,
      1,
    ),
  ];

  TetrominoS() : super('S', 1);
}

class TetrominoZ extends Tetromino {
  @override
  final blocks = [
    Point(
      Tetromino.gridWidth ~/ 2 - 1,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2,
      2,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 - 1,
      1,
    ),
    Point(
      Tetromino.gridWidth ~/ 2 - 2,
      1,
    ),
  ];

  TetrominoZ() : super('Z', 1);
}
