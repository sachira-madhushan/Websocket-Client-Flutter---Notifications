
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:websocketclient/controller/notification_controller.dart';
import 'dart:convert';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PusherChannelsFlutter pusher;

  @override
  void initState() {
    super.initState();
    InitNotifications();
    
  }
  void InitNotifications()async{
    pusher =await PusherChannelsFlutter.getInstance();

    try{
      await pusher.init(
      apiKey: "b719c869387772548d42",
      cluster: "ap2",
      
    );
    
    await pusher.connect();
    final myChannel = await pusher.subscribe(
      channelName: "notifications",
      onEvent:(event){
        print(event.data);
        Map<String, dynamic> dataMap = jsonDecode(event.data);
        NotificationController.createNewNotification(title:dataMap['title'],description:dataMap['description']);
      },
      //onEvent:onEvent,
      onSubscriptionError: onSubscriptionError
      
    );
    
    }catch(e){
      print("Error : "+e.toString());
    }
  }

  void onError(String message, int? code, dynamic e) {
  print("onError: $message code: $code exception: $e");
}
  void onEvent(dynamic event) {
    print("Event: "+event.data);
  }

  void onSubscriptionError(String message, dynamic e) {
  print("onSubscriptionError: $message Exception: $e");
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Listning....")),
    );
  }
  
}