import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nutrotional_tracking_app/core/constants/constant.dart';
import 'package:nutrotional_tracking_app/core/models/meal_model.dart';
import 'package:nutrotional_tracking_app/presentation/cubits/cubit/add_meal_cubit.dart';
import 'package:nutrotional_tracking_app/presentation/views/home_view.dart';
import 'package:nutrotional_tracking_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(MealModelAdapter());
  await Hive.openBox<MealModel>(kSelectedMeals);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => AddMealCubit(),
          child: AuthGate(),
        ),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // While checking auth status
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // User is logged in
        if (snapshot.hasData) {
          return const HomeView();
        }

        // Not logged in
        return const LoginScreen();
      },
    );
  }
}
