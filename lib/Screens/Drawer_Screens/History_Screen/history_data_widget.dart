import 'package:flutter/material.dart';
import 'package:note_pad2/Components/Driectories/Note_Pad_DBHelper_Classes/main_note_pad_db_provider_database.dart';
import 'package:note_pad2/Models/note_pad_model_class.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  final NotePadProvider _helper = NotePadProvider();
  List<NotePadModelClass> _emptyHistoryList = [];

  

  historyData() async{
    _emptyHistoryList = await _helper.getNotePad();
    setState(() {});
  }


  Future<void> _refresh(){
    historyData();
   return Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    historyData();
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      color: Colors.green,
      displacement: 50,
      strokeWidth: 3,
      backgroundColor: Colors.pink,
      child: ListView.builder(
        padding:const EdgeInsets.all(8),
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: _emptyHistoryList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            color: Colors.primaries[index % 5],
            child: ListTile(
              leading: Text(_emptyHistoryList[index].id.toString(),style: _textStyle(22, FontWeight.w200, FontStyle.italic,Colors.white)),
              title: Text(_emptyHistoryList[index].title.toString(),style: _textStyle(22, FontWeight.bold, FontStyle.italic,Colors.white),),
              subtitle: Text(_emptyHistoryList[index].description.toString(),style: _textStyle(15, FontWeight.w500, FontStyle.normal, const Color.fromARGB(255, 236, 236, 236)),
              maxLines: 3,overflow: TextOverflow.ellipsis),
              trailing: InkWell(
                onTap: () async{
                  bool delete =await _helper.deleteNotePad(id: _emptyHistoryList[index].id);
                  if (delete) {
                    setState(() {
                      historyData();
                    });
                  }
                },
                child:const Icon(Icons.delete,color: Colors.amber,)),
            ),
          );
        },),
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