

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 324.w,
        height: 42.h,
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Введите номер груза',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
