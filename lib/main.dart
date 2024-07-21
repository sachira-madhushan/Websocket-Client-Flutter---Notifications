import 'package:flutter/material.dart';
import 'package:websocketclient/controller/notification_controller.dart';
import 'package:websocketclient/home.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await NotificationController.initializeLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notification Channel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}