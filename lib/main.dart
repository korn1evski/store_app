import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/app_cubit_logics.dart';
import 'package:store_app/cubit/app_cubit_states.dart';
import 'package:store_app/cubit/app_cubits.dart';
import 'package:store_app/pages/detail_page.dart';
import 'package:store_app/services/data_services.dart';

import 'nav_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
        title: 'StoreApp',
        debugShowCheckedModeBanner: false,
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(data: DataServices()),
          child: NavPage(),)
    );
  }
}



