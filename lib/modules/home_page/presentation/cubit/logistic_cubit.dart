import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/base/app_state.dart';
import 'package:test_app/core/enums/state_status.dart';
import 'package:test_app/modules/home_page/domain/entity/logistic_entity.dart';
import 'package:test_app/modules/home_page/domain/usecase/get_logistic_usecase.dart';

class LogisticCubit extends Cubit<AppState<List<LogisticEntity>>> {
  final GetLogisticUsecase _getLogisticUsecase;

  LogisticCubit({
    required GetLogisticUsecase getLogisticUsecase,
  })  : _getLogisticUsecase = getLogisticUsecase,
        super(AppState(status: StateStatus.init));

  Future<void> getLogistic() async {
    emit(AppState(status: StateStatus.loading));
    try {
      final result = await _getLogisticUsecase.getLogisticList();
      emit(AppState(status: StateStatus.succes, model: result));
    } catch (e) {
      emit(AppState(status: StateStatus.error));
    }
  }
}

