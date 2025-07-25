import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/modules/home_page/data/repository/logistic_repository.dart';
import 'package:test_app/modules/home_page/domain/usecase/get_logistic_usecase.dart';
import 'package:test_app/modules/home_page/presentation/cubit/logistic_cubit.dart';
import 'package:test_app/modules/home_page/presentation/home_page_screen.dart';

void main() {
  runApp(const LogisticApp());
}

class LogisticApp extends StatelessWidget {
  const LogisticApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = LogisticRepository();
    final getLogisticUsecase = GetLogisticUsecaseImpl(repository);

    return ScreenUtilInit(
      designSize: const Size(1440, 794),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return BlocProvider(
          create:
              (_) =>
                  LogisticCubit(getLogisticUsecase: getLogisticUsecase)
                    ..getLogistic(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomePageScreen(),
          ),
        );
      },
    );
  }
}
