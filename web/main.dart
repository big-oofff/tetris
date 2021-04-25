import 'package:angular/angular.dart';

import 'app.template.dart' as ng;
import 'main.template.dart' as self;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: staticInjector);
}

@GenerateInjector([])
final staticInjector = self.staticInjector$Injector;
