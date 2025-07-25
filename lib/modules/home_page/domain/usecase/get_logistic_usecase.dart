import 'package:test_app/modules/home_page/data/repository/logistic_repository.dart';
import 'package:test_app/modules/home_page/domain/entity/logistic_entity.dart';

abstract class GetLogisticUsecase {
  Future<List<LogisticEntity>> getLogisticList();
}
class GetLogisticUsecaseImpl implements GetLogisticUsecase {
  final LogisticRepository repository;

  GetLogisticUsecaseImpl(this.repository);

  @override
  Future<List<LogisticEntity>> getLogisticList() {
    return repository.getLogistic();
  }
}