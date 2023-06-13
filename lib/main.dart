import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_ecommerce/shared/bloc_observer.dart';
import 'package:shop_ecommerce/shared/cubit/cubit.dart';
import 'package:shop_ecommerce/shared/cubit/states.dart';
import 'package:shop_ecommerce/shared/network/local/cache_helper.dart';
import 'package:shop_ecommerce/shared/network/remote/dio_helper.dart';
import 'package:shop_ecommerce/shared/styles/themes.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'features/login/cubit/cubit.dart';
import 'features/on_boarding/boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  DioHelper.init();


  runApp(MyApp(
    isDark: isDark,
    startWidget: OnBoardingScreen(),
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
           BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..changeAppMode( fromShared: isDark)
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark!
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: SplashScreenView(
                navigateRoute: startWidget,
                duration: 5000,
                imageSize: 130,
                imageSrc: "assets/images/icon.png",
                text: "Shop App",
                textType: TextType.ColorizeAnimationText,
                textStyle: const TextStyle(
                  fontSize: 40.0,
                ),
                colors: const [
                  Colors.red,
                  Colors.brown,
                  Colors.orange,
                  Colors.brown,
                ],
                backgroundColor: AppCubit.get(context).isDark!
                    ? HexColor('333739')
                    : Colors.white,
              ),
            );
          },
        ));
  }
}
