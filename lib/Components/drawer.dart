import 'package:flutter/material.dart';
import 'package:note_pad2/Components/colors/colors_file.dart';
import 'package:note_pad2/Screens/Routes/routes_method.dart';

class BeautifulDrawer extends StatefulWidget {
  const BeautifulDrawer({super.key});

  @override
  State<BeautifulDrawer> createState() => _BeautifulDrawerState();
}

class _BeautifulDrawerState extends State<BeautifulDrawer> {
  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.sizeOf(context).height;
    var widthMediaQuery = MediaQuery.sizeOf(context).width;
    return Drawer(
      elevation: 16,
      shadowColor: floatingPointButtonColors,
      backgroundColor: allScreenColors,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50),),
      child: ListView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
           //  (DrawerHeader)
          DrawerHeader(
            padding:const EdgeInsets.all(0),
            child: 
          Column(
            children: [
              Expanded(child: Center(child: Text("NotePad",
              style: _textStyle(35, FontWeight.bold, FontStyle.italic, Colors.white,),))),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: heightMediaQuery*0.1,
                  width: widthMediaQuery,
                  child: const Image(image: AssetImage("assest/images/notepad.png"))),
              ),
            ],
          )),
          //  List of Drawer Working .
         listTile(
          onTap: () => Navigator.pushNamed(context, RoutesName.historyScreen),
          text: "History",
          icon: Icons.history_toggle_off_sharp,
         ),
         listTile(
          onTap: () => Navigator.pushNamed(context, RoutesName.aboutScreen),
          text: "About",
          icon: Icons.info_outline_rounded
         )
           
        ],
      ),
    );
  }




  Widget listTile({String? text,IconData? icon,GestureTapCallback? onTap}){
    return InkWell(
      onTap: onTap,
      child: Card(
        color: allScreenColors,
        elevation: 10,
        shadowColor: Colors.green.withOpacity(0.2),
        margin:const EdgeInsets.all(10),
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: ListTile(
                title: Text(text.toString(),style: _textStyle(20, FontWeight.w500, FontStyle.normal, Colors.white),),
                leading: Icon(icon,color: Colors.white,),),
      ),
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