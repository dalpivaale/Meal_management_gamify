import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class ClassificaPage extends StatefulWidget{
    const ClassificaPage({Key? key}) : super(key: key);
  @override 
  ClassificaPageState createState() => ClassificaPageState();
}

class ClassificaPageState extends State<ClassificaPage>{
  
  void setValue(String valore) async{
 final prefs = await SharedPreferences.getInstance();
   prefs.setString("name", valore);
  }
  

  @override 
  Widget build(BuildContext context) =>  Scaffold(
        // backgroundColor: Colors.yellow,
    
        body:   
              Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),
                              decoration:BoxDecoration( 
                                image: DecorationImage(image:AssetImage('assets/background/orange3.jpg'),fit:BoxFit.cover,),
                                border: Border.all(
                                 color: Colors.white,
                                 width: 2),borderRadius: BorderRadius.circular(10.0)),
                               child: Column(
                                 children: [
                                  SizedBox(height: 40,),
                                  Align(alignment: Alignment.center,child: Text('LEADERBOARD',style:GoogleFonts.aclonica(color:Colors.black,fontSize:35))),
                                SizedBox(height: 20,),
                                 Card(color:Colors.transparent,elevation:0 ,child: ListTile(leading:Text('ACCOUNT',style:GoogleFonts.aclonica(fontSize: 18,color: Colors.black),),trailing:Text("LEVEL"+'         '+'SCORE',style:GoogleFonts.aclonica(fontSize: 18,color:Colors.black),))),
                                   Flexible(
                                     child: StreamBuilder(
                                           stream: FirebaseFirestore.instance
                                             .collection("utenti")
                                             .orderBy("livello", descending:true).orderBy("punti",descending:true).snapshots(),
                                           builder: (context,AsyncSnapshot snapshot) {
                                             if (!snapshot.hasData) return Text("Loading");
                                             return ListView.builder(
                                              scrollDirection: Axis.vertical,
                                                 itemCount:snapshot.data.docs.length,
                                                 itemBuilder: (context, index) {
                                                   
                                                    DocumentSnapshot dc = snapshot.data.docs[index];
                                                   return /*Card(child:Row(
                                                     children: [
                                                        Container(  margin: EdgeInsets.all(5), padding: EdgeInsets.all(4),height:45,width: 45, child:ClipPath(clipper: StarClipper(14),child:Container(color: Colors.blue, child: Align(alignment: Alignment.center, child: Text((index+1).toString(),style:TextStyle(fontSize:25)))))),
                                                        SizedBox(width: 3), Text(dc["utente"].toString(),style:GoogleFonts.aclonica(fontSize: 14)),  SizedBox(width: 90),                     
                                                       Text(dc["livello"].toInt().toString(),style:GoogleFonts.aclonica(fontSize: 14)),SizedBox(width: 90),Text(dc["punti"].toInt().toString(),style:GoogleFonts.aclonica(fontSize: 14)),
                                                     ],
                                                   ),
                                                   );*/ 
                                                 
                                                        Card(color:Colors.transparent ,child:ListTile(leading:                                                    
                                                                   Container(height:45,width: 45, child:ClipPath(clipper: StarClipper(14),child:Container(height:20,width: 20 , color: Colors.orange, child: Align(alignment: Alignment.center, child: Text((index+1).toString(),style:GoogleFonts.aclonica(fontSize: 20))))), 
                                                                     
                                                                   ),
                                                         title: Text(dc["utente"].toString(),style:GoogleFonts.aclonica(fontSize: 18)) ,                        
                                                         trailing: Text(dc["livello"].toInt().toString()+'                '+ dc["punti"].toInt().toString(),style:GoogleFonts.aclonica(fontSize: 18))),
                                                   );                                                     
                                                   
                                      });
                                           },
                                         ),
                                   ),
                                       Align( alignment: Alignment.bottomCenter,child: Text(DateFormat('EEEE').format(DateTime.now()) == 'Thursday' ? 'Today is Thursday you can win a Bonus Medal!' : '',style:TextStyle(fontSize:15,color:Colors.black,fontWeight: FontWeight.bold))),

                                       Align(alignment: Alignment.bottomCenter,child: ElevatedButton(style: ElevatedButton.styleFrom(elevation:0,
              
                    primary:Colors.transparent),onPressed:()=> Navigator.pop(context), child:Text('BACK',style:GoogleFonts.aclonica(color:Colors.black,fontSize:21)))),
                                    
                                   
                                 ],
                               ),
                             ),
                          
                         
                       
      );
         
}
  
class StarClipper extends CustomClipper<Path> {
  StarClipper(this.numberOfPoints);

  /// The number of points of the star
  final int numberOfPoints;

  @override
  Path getClip(Size size) {
    double width = size.width;

    double halfWidth = width / 2;

    double bigRadius = halfWidth;

    double radius = halfWidth / 1.3;

    double degreesPerStep = _degToRad(360 / numberOfPoints)as double;

    double halfDegreesPerStep = degreesPerStep / 2;

    var path = Path();

    double max = 2 * math.pi;

    path.moveTo(width, halfWidth);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(halfWidth + bigRadius * math.cos(step),
          halfWidth + bigRadius * math.sin(step));
      path.lineTo(halfWidth + radius * math.cos(step + halfDegreesPerStep),
          halfWidth + radius * math.sin(step + halfDegreesPerStep));
    }

    path.close();
    return path;
  }

  num _degToRad(num deg) => deg * (math.pi / 180.0);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    StarClipper oldie = oldClipper as StarClipper;
    return numberOfPoints != oldie.numberOfPoints;
  }

}
