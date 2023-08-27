import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'config/theme/colors/app_colors.dart';
import 'features/book/presentation/pages/home_page.dart';
import 'injection_container.dart';

void main() async {
  await initializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BookBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.scafoldBackground),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
