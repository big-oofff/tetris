enum Direction {
  EAST,
  NORTH,
  WEST,
  SOUTH,
}

class Point {
  int x;
  int y;

  Point(this.x, this.y);
}

abstract class Tetromino {
  static const _nextDirection = {
    Direction.EAST: Direction.NORTH,
    Direction.NORTH: Direction.WEST,
    Direction.WEST: Direction.SOUTH,
    Direction.SOUTH: Direction.EAST,
  };

  /// Direction of the block
  Direction direction;

  Point position;

  final String type;

  Tetromino(this.type, this.direction, this.position);

  void rotate() {
    direction = _nextDirection[direction];
  }

  void move(int dx) {
    position.x += dx;
  }

  List<Point> getPoints();
}

class TetrominoI extends Tetromino {
  TetrominoI(Point position) : super('I', Direction.EAST, position);

  @override
  List<Point> getPoints() {
    return direction == Direction.EAST || direction == Direction.WEST
        ? [
            Point(position.x - 1, position.y),
            Point(position.x, position.y),
            Point(position.x + 1, position.y),
            Point(position.x + 2, position.y),
          ]
        : [
            Point(position.x, position.y - 1),
            Point(position.x, position.y),
            Point(position.x, position.y + 1),
            Point(position.x, position.y + 2),
          ];
  }
}
