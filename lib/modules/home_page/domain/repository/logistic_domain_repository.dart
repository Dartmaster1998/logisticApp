import 'package:test_app/modules/home_page/domain/entity/logistic_entity.dart';

abstract class LogisticDomainRepository {
  Future<LogisticEntity> getLogistic();
}