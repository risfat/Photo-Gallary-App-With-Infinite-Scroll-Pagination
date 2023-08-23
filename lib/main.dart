import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ixora_solution_assignment/screens/photo_gallery_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'data/providers/photo_gallery_provider.dart';
import 'network/network_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initialize();
  runApp(
    ChangeNotifierProvider(
      create: (context) => PhotoGalleryProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: PhotoGalleryScreen(),
    );
  }
}

