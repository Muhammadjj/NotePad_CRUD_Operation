import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_pad2/Models/note_pad_model_class.dart';
import 'package:note_pad2/Screens/Drawer_Screens/History_Screen/history_data_widget.dart';
import 'package:note_pad2/Screens/Routes/routes_method.dart';

import '../../../Components/Colors/colors_file.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  List<NotePadModelClass> historyEmpty = [];

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allScreenColors,
      appBar: AppBar(
        backgroundColor: allScreenColors,
        centerTitle: true,
        title: AutoSizeText("NOTES",
        style: _textStyle(30, FontWeight.bold, FontStyle.italic, Colors.white),),
        leading: InkWell(
          onTap: () => Navigator.pushNamed(context, RoutesName.firstScreen),
          child:const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      
      body: historyEmpty.isEmpty ?
      const History():
      const History(),
      
    );
  }

  // ** All Text Using TextStyle.
  TextStyle _textStyle(
      double fontSize, FontWeight weight, FontStyle fontStyle, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        fontStyle: fontStyle,
        color: color);
  }
}