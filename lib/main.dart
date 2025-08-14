import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webwork_task/app.dart';
import 'package:webwork_task/firebase_options.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}
