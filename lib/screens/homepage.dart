import 'package:basic_navigation/utils/download.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:basic_navigation/database/entities/level.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_navigation/repositories/databaseRepository.dart';
import 'package:intl/intl.dart';
import 'package:basic_navigation/utils/event_provider.dart';

class HomePage extends StatefulWidget{
    const HomePage({Key? key}) : super(key: key);
  @override 
  HomePageState createState() => HomePageState();

}

class HomePageState extends State<HomePage> {
  Level level = Level(null,0,0,1); 
  String nome = '';
  String Email = '';
  //final DateFormat dateFormat =DateFormat('EEEE').format(DateTime.now());

     @override
  void initState(){
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {

    return Scaffold( backgroundColor: Colors.black,
      appBar: PreferredSize(preferredSize: Size.fromHeight(35),
        child: AppBar(title: Align(alignment:Alignment.center ,child: Text('Home')),
          elevation: 0,
           backgroundColor: Color.fromARGB(255, 66, 64, 64)),
      ),
      
         drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
           DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 66, 64, 64),
              ),
                child: Column(
                  children: [
                    Container(child:  Icon(Icons.account_circle_rounded,size:60,color: Color.fromARGB(255, 248, 249, 250),),width:320,
                      height: 100,decoration: BoxDecoration(shape:BoxShape.circle,gradient: LinearGradient(begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,colors: [Color.fromARGB(255, 249, 3, 3),Color.fromARGB(255, 249, 151, 3)]),/*borderRadius: BorderRadius.circular(12)*/),),
                        SizedBox(height:10),
                      
                  FutureBuilder(
                future: _getUsername(),
                 builder: (context, child){
                      return   Text(Email,style:TextStyle(fontSize:20));})
                  ],
                ),
             
            ),
            Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(10),height:MediaQuery.of(context).size.height/11,
              child: ElevatedButton(onPressed:() async{DownloadDb downloader = DownloadDb(db: Provider.of<DatabaseRepository>(context, listen: false).database);
              bool done = await downloader.downloadData();const snackBar = SnackBar(content: Text('Meals saved in your phone'),duration: Duration(seconds:5),);
                ScaffoldMessenger.of(context).showSnackBar(snackBar); Navigator.pop(context);},
                 child: Text('Download data',style:TextStyle(fontSize: 16)), /*style: ElevatedButton.styleFrom(padding:EdgeInsets.all(10))*/),
            ),
         
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text('Profile'),
              onTap: () => Navigator.pushNamed(context, 'profile')
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Info'),
              onTap: () =>Navigator.pushNamed(context, 'info')
            ),
              ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),
      body: Padding(
       padding: const EdgeInsets.all(0.01),
       child: Consumer<DatabaseRepository>(
          builder: (context, dbr, child) {
           return FutureBuilder(
              initialData: null,
              future: dbr.findAllLevels(),
              builder:(context, snapshot) { 
              var livello = <Level> [Level(null, 0, 0, 1)];
              if(snapshot.hasData){
                livello = snapshot.data as List<Level>;                 
              }             
         level = livello.isEmpty ? Level(null, 0,0,1)  : level = livello[0];
      return Column(
        children: [
        //  Align(alignment: Alignment.centerLeft,child: Text('Hello  '+nome +'!',style: TextStyle(fontSize: 20, color: Colors.white,fontWeight:FontWeight.bold))),
           // SizedBox(height:10),
            FutureBuilder(
                future: _getName(),
                 builder: (context, child) {                             
                          return Align(alignment: Alignment.centerLeft,child: Text('Hello  '+nome +'!',style: TextStyle(fontSize: 20, color: Colors.white,fontWeight:FontWeight.bold)));
                 }
                ),
                 SizedBox(height:5),
                      Stack(
                        alignment: Alignment.center, 
                         clipBehavior: Clip.none,
                       // fit: StackFit.passthrough, 
                        children:[ 
                  Container(
                      height:MediaQuery.of(context).size.height/4,width: double.infinity,margin: EdgeInsets.all(0), padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0),)
                  ),
                   Align(
                    alignment: Alignment.centerLeft,
                     child: Container(
                                     margin: EdgeInsets.all(0), padding: EdgeInsets.all(5),
                      height:MediaQuery.of(context).size.height/4,
                      width: MediaQuery.of(context).size.width/2.2,
                      decoration: BoxDecoration(
                       /* gradient: LinearGradient(begin: Alignment.topLeft,
                        end: Alignment.bottomRight,colors: [Color.fromARGB(255, 245, 4, 4),Color.fromARGB(255, 244, 252, 4)]),*/
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/cibo2.jpg'),
                          opacity: 5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ),
                   ), Align(
                    alignment: Alignment.centerRight,heightFactor:1.7,
                     child: Container(margin: EdgeInsets.all(0), padding: EdgeInsets.all(5),
                       child: Column(
                          children: [
                           // SizedBox(height:10),
                            Text(' Meal management ',style: TextStyle(fontSize: 21, color: Colors.black,fontWeight:FontWeight.bold)),
                          //  SizedBox(height:12),
                            Text('Track your meals'+ '\n' + 'every day and win'+ '\n'+'the rewards!',style: TextStyle(fontSize: 17, color: Colors.black,fontWeight:FontWeight.bold)),
                            
                          ],
                        ),
                     ),
                   ),
                                 
                  
        ]),
                   Container(
                           width: double.infinity,
                          height: 140,
                         margin: EdgeInsets.all(3), padding: EdgeInsets.all(5), decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/background/red3.jpg'),fit:BoxFit.cover),
                            border: Border.all(color: Color.fromARGB(255, 8, 8, 8),
                             width: 2),borderRadius: BorderRadius.circular(10.0),/*gradient: LinearGradient(begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,colors: [Colors.white,Colors.white]),*//*borderRadius: BorderRadius.circular(12)*/),
                                            child:
                                            ListView(children: [
                          Align(alignment: Alignment.center,child: Text("Medal  Collection",style:GoogleFonts.acme(color:Colors.white,fontSize:35))),
                         
                          Align(alignment:Alignment.bottomCenter,child: IconButton(iconSize:65,icon: Container(width:80,height:95,decoration:BoxDecoration(image:DecorationImage(image:AssetImage('assets/background/trophy2.png'),fit:BoxFit.cover))),onPressed: (){Navigator.pushNamed(context, 'medals'); },)),               
                            ],
                                            )
                                            ),
             //  SizedBox(height:5),                          
          Row(
               mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize : MainAxisSize.center,
            children:[
                Container(
                  height:200,
                   width: MediaQuery.of(context).size.width/2.11,
                   margin: EdgeInsets.all(2), padding: EdgeInsets.all(10), decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/background/orange3.jpg'),fit:BoxFit.cover,),
                    gradient: LinearGradient(begin: Alignment.topLeft,
                  end: Alignment.bottomRight,colors: [Colors.orange,Colors.white]),
                            border: Border.all(
                             color: Color.fromARGB(255, 8, 8, 8),
                             width: 2),borderRadius: BorderRadius.circular(10.0)),
                     child: ListView(
                       children:[ 
                         Row(
                             children: [
                               Text('SCORES TO'+'\n'+ 'NEXT LEVEL',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 12)),
                              Spacer(),
                                 Icon(Icons.leaderboard_rounded,size:30,color: Colors.black,)
                                // IconButton(icon:Icon( Icons.badge_outlined,size:30,color: Colors.black),onPressed:()=>print(DateFormat('EEEE').format(DateTime.now()))),
                             ],
                           ),
                  SizedBox(height: 8),              
                    CircularPercentIndicator(radius: 50,percent: (level.counter / (level.a*200)),lineWidth : 5.0,animation: true, animationDuration:5000 ,
                             center: Text((level.counter.toInt().toString() + ' ' + '/ '+ (level.a*200).toInt().toString()), style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600, color: Color.fromARGB(255, 251, 250, 250)),),
                             circularStrokeCap: CircularStrokeCap.round,  progressColor: Colors.redAccent,backgroundColor: Color.fromARGB(207, 252, 254, 253),
                              header: Text('Level '+ level.livello.round().toString(),style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold)),
                                         restartAnimation: true,)                                       
                      ] )
                ),  

                     Container(
                  height:200,
                  width: MediaQuery.of(context).size.width/2.11,
                   margin: EdgeInsets.all(2), padding: EdgeInsets.all(10), decoration: BoxDecoration( image: DecorationImage(image:AssetImage('assets/background/orange3.jpg'),fit:BoxFit.cover,),
                    gradient: LinearGradient(begin: Alignment.topLeft,
                  end: Alignment.bottomRight,colors: [Colors.orange,Colors.white]),
                           // color: Color.fromARGB(255, 108, 183, 244),
                            border: Border.all(
                             color: Colors.black,
                             width: 2),borderRadius: BorderRadius.circular(10.0)),
                     child: ListView(
                       children:[ 
                            Row(
                              children: [
                                 Text('LEADERBOARD',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 14)),
                      Spacer(), IconButton(icon: Icon(Icons.military_tech_rounded,color:Colors.black,size:30),onPressed:()async { final sp = await SharedPreferences.getInstance(); FirebaseFirestore.instance.collection("utenti").doc(sp.getString('username')).set({
                            "livello":level.livello.toInt(), "utente": sp.getString('name')==null ?  sp.getString('username')!.substring(0,7): sp.getString('name'),
                            "punti": level.counter,"username":sp.getString('username')});
                            Navigator.pushNamed(context,'leaderboard');}),
                      
                              ],
                            ),
                        IconButton(icon: Icon(Icons.leaderboard_rounded,size: 70,),color: Colors.white,onPressed:()async { final sp = await SharedPreferences.getInstance(); FirebaseFirestore.instance.collection("utenti").doc(sp.getString('username')).set({
                             "livello":level.livello.toInt(), "utente": sp.getString('name')==null ||sp.getString('name')==''?  sp.getString('username')!.substring(0,7)  : sp.getString('name'),
                             "punti": level.counter,"username":sp.getString('username')});
                             Navigator.pushNamed(context,'leaderboard');}),
                      SizedBox(height: 1), 
                     Align(heightFactor:2.2,alignment: Alignment.bottomCenter,child: Text('beat other \n players',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 15))),
                              
                      ] )
                ), 
               ]
               ),
          ]
      );
              }
           );
          }
       )
      ),

      floatingActionButton: FloatingActionButton(
      child: Icon(Icons.calendar_month_rounded,color: Colors.white,),
      backgroundColor: Color.fromARGB(255, 249, 8, 8),
      onPressed: () =>Navigator.pushNamed(context, 'calendar'))
    ); 
  }

  Future<String> _getName() async{
    final sp = await SharedPreferences.getInstance();
    return nome = sp.getString('name') as String;  
  }
  Future<String> _getUsername() async{
    final sp = await SharedPreferences.getInstance();
   return Email = sp.getString('username') as String;  
  }
     void _toLoginPage(BuildContext context) async {
  //Unset the 'username' filed in SharedPreference
  final sp = await SharedPreferences.getInstance();
  sp.remove('username');

  //Pop the drawer first
  Navigator.pop(context);
  //Then pop the HomePage
  Navigator.of(context).pushReplacementNamed('login');
   }  
}


