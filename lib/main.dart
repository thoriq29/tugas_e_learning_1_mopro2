import 'package:flutter/material.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/pages/home.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/provider/assignment_provider.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/provider/homeProvider.dart';
import 'package:provider/provider.dart';

import 'common/date_time_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DateTimeUtils.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider()
        ),
        ChangeNotifierProvider(
          create: (_) => AssignmentProvider()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      )
    );
  }
}