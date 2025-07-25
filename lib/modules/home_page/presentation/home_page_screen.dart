import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/modules/drawer/side_navigation.dart';
import 'package:test_app/modules/home_page/presentation/cubit/logistic_cubit.dart';
import 'package:test_app/modules/home_page/presentation/widgets/header_widget.dart';
import 'package:test_app/modules/home_page/presentation/widgets/pagination_widget.dart';
import 'package:test_app/modules/home_page/presentation/widgets/search_widget.dart';
import 'package:test_app/modules/home_page/presentation/widgets/table_widget.dart';
import 'package:test_app/modules/home_page/presentation/widgets/title_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentPage = 1;
  final int itemsPerPage = 9;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _goToPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<LogisticCubit>().getLogistic();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.trim();
        currentPage = 1;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavigation(onItemSelected: (String route) {}),
      appBar: AppBar(actions: [HeaderWidget()]),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 400),
                    child: Text(
                      "Грузы на складе в Китае",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                AddLogisticWidget(),
              ],
            ),
            SizedBox(height: 20.h),
            SearchWidget(searchController: _searchController),
            SizedBox(height: 20.h),
            TableWidget(
              searchQuery: _searchQuery,
              itemsPerPage: itemsPerPage,
              currentPage: currentPage,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: PaginationWidget(
                currentPage: currentPage,
                itemsPerPage: itemsPerPage,
                searchQuery: _searchQuery,
                onPageChanged: _goToPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
