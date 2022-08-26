import 'package:ecommerce_project/bloc/detail_bloc/detail_bloc.dart';
import 'package:ecommerce_project/bloc/detail_bloc/detail_repository.dart';
import 'package:ecommerce_project/bloc/main_bloc/main_bloc.dart';
import 'package:ecommerce_project/bloc/main_bloc/main_repository.dart';
import 'package:ecommerce_project/bloc/my_cart_bloc/my_cart_bloc.dart';
import 'package:ecommerce_project/bloc/my_cart_bloc/my_cart_repository.dart';
import 'package:ecommerce_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final mainRepository = MainRepository();
  final detailRepository = DetailRepository();
  final myCartRepository = MyCartRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBloc(mainRepository: mainRepository),
        ),
        BlocProvider(
          create: (context) => DetailBloc(detailRepository: detailRepository),
        ),
        BlocProvider(
          create: (context) => MyCartBloc(myCartRepository: myCartRepository),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 736),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appTitle,
          initialRoute: AppRoutesString.routeToMainScreen,
          routes: Constants.appRoutes,
        ),
      ),
    );
  }
}
