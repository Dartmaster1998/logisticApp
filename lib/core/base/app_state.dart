import 'package:test_app/core/enums/state_status.dart';

class AppState<T> {
  T? model;
  StateStatus status;
  AppState({ this.model, required this.status});
}
