import 'package:clean_architechture_temp/features/book/presentation/blocs/article/remote/bloc/remote_book_bloc.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => sl<RemoteBookBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
