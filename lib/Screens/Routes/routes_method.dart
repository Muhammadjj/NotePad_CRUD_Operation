import 'package:flutter/material.dart';
import 'package:note_pad2/Screens/Drawer_Screens/About_Screen/main_about_screen.dart';
import 'package:note_pad2/Screens/Drawer_Screens/History_Screen/main_history_screen.dart';

import '../../Models/note_pad_model_class.dart';
import '../First_Screen/Update_data_Screen/main_update_screen.dart';
import '../First_Screen/View_Data_Screen/main_view_screen.dart';
import '../Second_Screen/Insert_Data_Screen/main_insert_screen.dart';
import '../Splash_Screen/main_splash_screen.dart';



class RoutesName {
  static const String splashScreen = "splashScreen";
  static const String firstScreen = "fetchScreen";
  static const String secondScreen = "insertScreen";
  static const String thirdScreen = "updateScreen";
  static const String historyScreen = "historyScreen";
  static const String aboutScreen = "aboutScreen";

}





class RoutesMethod{
  static Route<dynamic>? onGenerate(RouteSettings settings){
    if (settings.name == RoutesName.splashScreen) {
      return MaterialPageRoute(builder: (context) => const SplashScreen(),);
    }else if (settings.name == RoutesName.firstScreen) {
      return MaterialPageRoute(builder: (context) => const FetchingScreen(),);
   }else if(settings.name == RoutesName.secondScreen){
    return MaterialPageRoute(builder: (context) => const InsertScreen(),);
   }else if(settings.name == RoutesName.thirdScreen){
    return MaterialPageRoute(builder: (context) =>  UpdateData(modelClass: settings.arguments as NotePadModelClass),);
   }else if(settings.name == RoutesName.historyScreen){
    return MaterialPageRoute(builder: (context) => const HistoryScreen(),);
   }else if(settings.name == RoutesName.aboutScreen){
    return MaterialPageRoute(builder: (context) => const AboutScreen(),);
   }else{
     return MaterialPageRoute(builder: (context) {
       return  const Scaffold(
        backgroundColor: Colors.red,
        body: Center(child: Text("Do'nt Found This Pages. ",style: TextStyle(color: Colors.white),),),);
     },);
   }
  }
}