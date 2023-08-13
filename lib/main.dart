import 'package:cash_app/bloc_observer.dart';
import 'package:cash_app/features/auth/data/data_provider/local/my_config_cache.dart';
import 'package:cash_app/features/auth/managers/auth_cubit.dart';
import 'package:cash_app/features/home_layout/presentaion/managers/air_charge/air_charge_cubit.dart';
import 'package:cash_app/features/home_layout/presentaion/managers/settings_cubit.dart';
import 'package:cash_app/features/splash/presentation/views/splash_view_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await MyConfigCach.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AuthCubit()),
              BlocProvider(create: (context) => AirChargeCubit()),
              BlocProvider(create: (context) => SettingsCubit()..getUserProfile()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                textTheme: GoogleFonts.alikeAngularTextTheme(),
              ),
              home: const SplashView(),
            ),
          ),
        );
      },
    );
  }
}
