import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/base/app_state.dart';
import 'package:test_app/modules/home_page/domain/entity/logistic_entity.dart';
import 'package:test_app/modules/home_page/presentation/cubit/logistic_cubit.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int itemsPerPage;
  final String searchQuery;
  final void Function(int) onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.itemsPerPage,
    required this.searchQuery,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogisticCubit, AppState<List<LogisticEntity>>>(
      builder: (context, state) {
        if (state.model == null || state.model!.isEmpty) {
          return const SizedBox.shrink();
        }

        final filteredList = state.model!.where((item) {
          // ignore: unrelated_type_equality_checks
          return item.idNumber != 0 &&
              item.idNumber.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();

        final totalPages = (filteredList.length / itemsPerPage).ceil();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
              icon: const Icon(Icons.first_page),
            ),
            Wrap(
              spacing: 4,
              children: List.generate(totalPages, (index) {
                final page = index + 1;
                final isSelected = currentPage == page;

                return ElevatedButton(
                  onPressed: () => onPageChanged(page),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
                    foregroundColor: isSelected ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: Text("$page"),
                );
              }),
            ),
            IconButton(
              onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
              icon: const Icon(Icons.last_page),
            ),
          ],
        );
      },
    );
  }
}