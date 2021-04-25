import 'dart:html';

import 'package:angular/angular.dart';

import 'grid.dart';

@Component(
  selector: 'app',
  directives: [coreDirectives],
  templateUrl: 'app.html',
  styleUrls: ['app.css'],
)
class AppComponent {
  final grid = Grid();

  void onKeyUp(KeyboardEvent event) {
    switch (event.keyCode) {
      case KeyCode.LEFT:
        grid.rotateActiveBlock();
        break;
    }
  }
}
