import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/base/app_state.dart';
import 'package:test_app/core/enums/state_status.dart';
import 'package:test_app/modules/home_page/domain/entity/logistic_entity.dart';
import 'package:test_app/modules/home_page/presentation/cubit/logistic_cubit.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required String searchQuery,
    required this.itemsPerPage,
    required this.currentPage,
  }) : _searchQuery = searchQuery;

  final String _searchQuery;
  final int itemsPerPage;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<LogisticCubit, AppState<List<LogisticEntity>>>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == StateStatus.error) {
            return Center(child: Text('Не удалось загрузить данные'));
          } else if (state.model == null || state.model!.isEmpty) {
            return const Center(child: Text("Нет данных"));
          }

          final fullList = state.model!;
          final filteredList =
              fullList.where((item) {
                // ignore: unrelated_type_equality_checks
                return item.idNumber != 0 &&
                    item.idNumber.toLowerCase().contains(
                      _searchQuery.toLowerCase(),
                    );
              }).toList();

          (filteredList.length / itemsPerPage).ceil();
          final visibleItems =
              filteredList
                  .skip((currentPage - 1) * itemsPerPage)
                  .take(itemsPerPage)
                  .toList();

          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 2, 61, 119),
                    ),
                    headingTextStyle: const TextStyle(color: Colors.white),
                    columns: const [
                      DataColumn(label: Text('Код клиента')),
                      DataColumn(label: Text('Номер груза')),
                      DataColumn(label: Text('Категория товара')),
                      DataColumn(label: Text('Количество мест')),
                      DataColumn(label: Text('Статус для клиента')),
                      DataColumn(label: Text('Коментарии')),
                      DataColumn(label: Text('')),
                    ],
                    rows:
                        visibleItems.map((item) {
                          return DataRow(
                            cells: [
                              DataCell(Text(item.clientCode)),
                              DataCell(Text(item.idNumber)),
                              DataCell(Text(item.category)),
                              DataCell(Text('${item.packageCount}/10')),
                              DataCell(
                                Text(
                                  item.status,
                                  style: TextStyle(
                                    color:
                                        item.status.toLowerCase() == "в пути"
                                            ? Colors.green
                                            : Colors.black,
                                  ),
                                ),
                              ),
                              DataCell(Text(item.comment ?? '')),
                              DataCell(Icon(Icons.delete)),
                            ],
                          );
                        }).toList(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
