import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/posts/presentation/bloc/get_post_cubit.dart';
import 'package:task/features/posts/presentation/pages/post_screen.dart';
import 'core/dependancy_injection/injection.dart';
import 'core/dependancy_injection/injection_utils.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => sl<GetPostCubit>(),
        child: const PostsScreen(),
      ),
    );
  }
}
