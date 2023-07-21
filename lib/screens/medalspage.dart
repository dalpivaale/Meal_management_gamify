import 'package:basic_navigation/database/entities/level.dart';
import 'package:flutter/material.dart';
import 'package:basic_navigation/utils/methods.dart';
import 'package:basic_navigation/repositories/databaseRepository.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedalsPage extends StatefulWidget{
     MedalsPage({Key? key}) : super(key: key);

  @override
  State<MedalsPage> createState() => _MedalsPageState();
}
class _MedalsPageState extends State<MedalsPage> {
  List<Color?> colori = [Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,
        Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey];
 @override
  void initState() {
    super.initState();
  }
 var medals = [0,3,1,4,2 ,5,7,8,6,9 ,11,14,12,13,10 ,18,16,15,17,19 ,21,20,22,23];
 String? name = '';
  @override 
  Widget build(BuildContext context){ 
    Size screenSize = MediaQuery.of(context).size;
     return  Scaffold( backgroundColor: Colors.black,
      appBar:PreferredSize( preferredSize: Size.fromHeight(30),
        child: AppBar(
          title:  Align(alignment:Alignment.center,child:Text('Breakfast',style: TextStyle(color:Colors.white),)), backgroundColor: Colors.black,
        ),
      ),
      body:  Container(
       //  decoration: BoxDecoration(image:DecorationImage(image:AssetImage('assets/background/red1.jpg'),fit:BoxFit.cover,)),
       padding: const EdgeInsets.all(1),
       child: 
       FutureBuilder(
           initialData: null,
              future: _color(), 
        builder:(context, snapshot){
      return /*Center(
          child:*/ ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
          Divider(color: Colors.white,thickness: 1,indent: 4,endIndent: 4,),
              horizontalList1(screenSize),
                        SizedBox(height: 20,),
          Container(child: Text('Lunch',style: TextStyle( fontSize:20,fontWeight: FontWeight.bold,color: Colors.white)),alignment:Alignment.center),
          Divider(color: Colors.white,thickness: 1,indent: 4,endIndent: 4,),
              horizontalList2(screenSize),
                    SizedBox(height: 20,),
          Container(child: Text('Dinner',style: TextStyle( fontSize:20,fontWeight: FontWeight.bold,color: Colors.white)),alignment:Alignment.center),
          Divider(color: Colors.white,thickness: 1,indent: 4,endIndent: 4,),
              horizontalList3(screenSize),
                SizedBox(height: 10,),
          Container(child: Text('Snack & Dessert',style: TextStyle( fontSize:20,fontWeight: FontWeight.bold,color: Colors.white)),alignment:Alignment.center,),
          Divider(color: Colors.white,thickness: 1,indent: 4,endIndent: 4,),
              horizontalList4(screenSize),
    
            ],
          );
        }
      )               
      ),
           );
  }
    Widget horizontalList1(Size screenSize) => Container(
      margin: EdgeInsets.symmetric(vertical:7),
      height: 115.0,
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/cookie.png"), width: screenSize.width/8.3,height:screenSize.height/13, color:colori[0],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
    SizedBox(width: 60,),                                 
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/milk.jpg"), width: screenSize.width/8.3,height:screenSize.height/13, color:colori[1],
                                  fit: BoxFit.scaleDown,alignment: Alignment.center),),
         SizedBox(width: 60,),                                
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/fried-egg.png"), width: screenSize.width/8.3,height:screenSize.height/13, color:colori[2],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
         SizedBox(width: 60,),                                  
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/sausage.png"), width: screenSize.width/8.3,height:screenSize.height/13, color:colori[3],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
      SizedBox(width: 60,),                                     
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/croissantIcon.png"), width: screenSize.width/8.3,height:screenSize.height/13, color:colori[4],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
         SizedBox(width: 60,),                                  
    Column(
      children: [
        Container(width: 160.0, child: Image(image:  AssetImage("assets/images/donut.png"), width: screenSize.width/8.3,height:screenSize.height/11, color:colori[23],
                                      fit: BoxFit.scaleDown,alignment: Alignment.center)),SizedBox(height:10),
                                       Expanded(child: Text('Bonus',style:TextStyle(fontSize:20,color: Colors.white))),
      ],
    ),
        ],
    )
    );

   Widget horizontalList2(Size screenSize) => Container(
      margin: EdgeInsets.symmetric(vertical:7),
      height: 115.0,
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/pizza.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[5],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
    SizedBox(width: 60,),                                 
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/sushi.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[6],
                                  fit: BoxFit.scaleDown,alignment: Alignment.center),),
         SizedBox(width: 60,),                                
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/fish.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[7],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
         SizedBox(width: 60,),                                  
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/meat.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[8],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
      SizedBox(width: 60,),                                     
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/cabbage.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[9],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
         SizedBox(width: 60,),                                  
    Column(
      children: [
        SizedBox(height: 10),
         Container(width: 160.0, child: Image(image:  AssetImage("assets/images/taco.png"), width: screenSize.width/8.3,height:screenSize.height/11, color:colori[21],
                                        fit: BoxFit.scaleDown,alignment: Alignment.center)),
        SizedBox(height:10),
                                       Expanded(child: Text('Bonus',style:TextStyle(fontSize:20,color: Colors.white)))
      ],
    )
        ],
    )
    );
    Widget horizontalList3(Size screenSize) => Container(
        margin: EdgeInsets.symmetric(vertical:7),
        height: 115.0,
        child:  ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
      Container(width: 160.0, child: Image(image:  AssetImage("assets/images/broccoli(1).png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[10],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
       SizedBox(width: 60,),                             
        Container(width: 160.0, child: Image(image:  AssetImage("assets/images/burger.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[11],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
        SizedBox(width: 60,),
          Container(width: 160.0, child: Image(image:  AssetImage("assets/images/spaguetti.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[12],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
    SizedBox(width: 60,),
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/wine-glass.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[13],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
     SizedBox(width: 60,),
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/fruit-salad.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[14],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
     SizedBox(width: 60,),   
     Column(
       children: [SizedBox(height: 10),
         Container(width: 160.0, child: Image(image:  AssetImage("assets/images/apple.png"), width: screenSize.width/8.3,height:screenSize.height/11, color:colori[20],
                                      fit: BoxFit.scaleDown,alignment: Alignment.center)),SizedBox(height:10),
                                       Expanded(child: Text('Bonus',style:TextStyle(fontSize:20,color: Colors.white)))
       ],
     ),
  
    ]
    )
    );
    Widget horizontalList4(Size screenSize) => Container(
        margin: EdgeInsets.symmetric(vertical:7),
        height: 115.0,
        child:  ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
      Container(width: 160.0, child: Image(image:  AssetImage("assets/images/mai-thai.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[15],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
       SizedBox(width: 60,), 
        Container(width: 160.0, child: Image(image:  AssetImage("assets/images/ice-cream.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[16],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
        SizedBox(width: 60,),   
          Container(width: 160.0, child: Image(image:  AssetImage("assets/images/snackIcon.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[17],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
    SizedBox(width: 60,),
    Container(width: 160.0, child: Image(image:  AssetImage("assets/images/watermelon.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[18],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
    SizedBox(width: 60,),
   Container(width: 160.0, child: Image(image:  AssetImage("assets/images/cake.png"), width: screenSize.width/8.3,height:screenSize.height/12, color:colori[19],
                                   fit: BoxFit.scaleDown,alignment: Alignment.center),),
    SizedBox(width: 60,),
    Column(
      children: [
        Container(width: 160.0, child: Image(image:  AssetImage("assets/images/chocolate.png"), width: screenSize.width/8.3,height:screenSize.height/11, color:colori[22],
                                      fit: BoxFit.scaleDown,alignment: Alignment.center)), SizedBox(height:10),
                                       Expanded(child: Text('Bonus',style:TextStyle(fontSize:20,color: Colors.white)))
      ],
    ),
   ]
    )
    );

Future<List<Color?>> _color() async{ //Colora le medaglie sbloccate dal solo caricamento dei pasti non le colora in base ai trigger  //gli ultimi 4 numeri sono per la medaglia bonus
   
    List<DateTime> colazioni = []; 
    var eventi =   await Provider.of<DatabaseRepository>(context, listen: false).findAllEvents();
    var livello = await Provider.of<DatabaseRepository>(context, listen: false).findAllLevels();
     final sp = await SharedPreferences.getInstance();
   int count = 1;
   int j = 1;
if(livello.isNotEmpty){ //sto if è solo per colorare la prima medaglia senza soddisfare i trigger
    if(livello[0].livello >0)
          colori[medals[0]] = null;
    else{ //altrimenti livello = 0 per forza allora verifico che counter sia > 0
    if(livello[0].counter > 0)
          colori[medals[0]] = null;}
  }

   for(int i = 0; i < eventi.length;i++){
        if(eventi[i].colazione != '')
          colazioni.add(eventi[i].from);
       }         
   colazioni.sort((a, b) =>  a.compareTo(b));//sorting in ascending order   
   for(int i = 0;i < colazioni.length-1;i++){    
        if((colazioni[i+1].difference(colazioni[i])).inDays == 1)
             count++;                  
        else 
            count = 1;
    if(count%4 == 0){
         
         colori[medals[j]] = null;
         j++;
    
    }
//-----4 GIORNI DI FILA PRANZO
    List<DateTime> pranzo = []; 
   int k = 5;
   int countp = 1;
   for(int i = 0; i < eventi.length;i++){
        if(eventi[i].pranzo1 != '' || eventi[i].pranzo2 != '' || eventi[i].pranzo3 != '' || eventi[i].pranzo4 != '')
          pranzo.add(eventi[i].from);
       }      
         
   pranzo.sort((a, b) =>  a.compareTo(b));//sorting in ascending order   
   for(int i = 0;i < pranzo.length-1;i++){    
        if((pranzo[i+1].difference(pranzo[i])).inDays == 1)
             countp++;            
            
        else 
            countp = 1;

   if(countp%4 == 0){
         
         colori[medals[k]] = null;
         k++;
    }        
    } 
  }
  // --- TRIGGER 4 GIORNI CENA
    List<DateTime> cena = []; 
   int l = 10;
   int countc = 1;
   for(int i = 0; i < eventi.length;i++){
        if(eventi[i].cena1 != '' || eventi[i].cena2 != '' || eventi[i].cena3 != '' || eventi[i].cena4 != '')
          cena.add(eventi[i].from);
       }      
         
   cena.sort((a, b) =>  a.compareTo(b));//sorting in ascending order   
   for(int i = 0;i < cena.length-1;i++){    
        if((cena[i+1].difference(cena[i])).inDays == 1)
             countc++;            
            
        else 
            countc = 1;

   if(countc%4 == 0){
      
         colori[medals[l]] = null;
         l++;}        
    } 

// ------TRIGGER 4 GIORNI DI FILA SNACK
List<DateTime> snack = []; 
   int m = 15;
   int counts = 1;
   for(int i = 0; i < eventi.length;i++){
        if(eventi[i].snack != '')
          snack.add(eventi[i].from);
       }      
         
   snack.sort((a, b) =>  a.compareTo(b));//sorting in ascending order   
   for(int i = 0;i < snack.length-1;i++){    
        if((snack[i+1].difference(snack[i])).inDays == 1)
             counts++;            
            
        else 
            counts = 1;

   if(counts%4 == 0){        
         colori[medals[m]] = null;
        m++;}        
    }
  
//--TRIGGER MEDAGLIE BONUS
  var i;

 if(DateFormat('EEEE').format(DateTime.now()) == 'Thursday'){   
  
      final docRef2 =   FirebaseFirestore.instance.collection("utenti").orderBy("livello", descending:true).orderBy("punti",descending:true);
   
      await docRef2.get().then(
       (QuerySnapshot<Map<String, dynamic>> doc) {
        var data = doc.docs.first.data();
     name =  data["username"].toString();}
     );

     print(name);

  if(sp.getInt('i') == null) 
      await sp.setInt('i',0);

 if( name == sp.getString('username')){ //se sono arrivato in cima alla classifica sblocco le medaglie bonus non ancora sbloccate
    i = sp.getInt('i');
   String a = (i!-1).toString();
    a = 'bonus'+a;
    if(sp.getString(a) == null ||sp.getString(a)!.substring(0,10) != DateTime.now().toString().substring(0,10)){
       await  sp.setString('bonus'+i.toString(), DateTime.now().toString()); i++;
       await  sp.setInt('i', i);}
 }
 
 }  

   if( sp.getString('bonus0') != null)
       colori[20] = null;

    if( sp.getString('bonus1') != null)
       colori[21] = null;
   
    if( sp.getString('bonus2') != null)
        colori[22] = null;
   
    if( sp.getString('bonus3') != null)
       colori[23] = null;
 
print('fine');   

    return colori;  

}

}
 
  /* var var list = Iterable<int>.generate(5).toList();
          list.shuffle();
           List<int> numbers = []; if(livello.isEmpty) await Provider.of<DatabaseRepository>(context, listen: false).insertLevel(Level(null,0,0,1));else await Provider.of<DatabaseRepository>(context, listen: false).updateLevel(Level(livello[0].id,0,0,1));
            while (list.isNotEmpty) {
           numbers.add(list.removeLast());} list = Iterable<int>.generate(5).toList();list.shuffle(); while (list.isNotEmpty) {numbers.add(list.removeLast()+5);} 
            list = Iterable<int>.generate(5).toList();list.shuffle(); while (list.isNotEmpty) {numbers.add(list.removeLast()+10);}
             list = Iterable<int>.generate(5).toList();list.shuffle(); while (list.isNotEmpty) {numbers.add(list.removeLast()+15);}
             print(numbers);           
           var medaglie = await Provider.of<DatabaseRepository>(context, listen: false).findAllMedals(); await Provider.of<DatabaseRepository>(context, listen: false).updateMedals(Medal(medaglie[0].id,numbers[0],numbers[1],numbers[2],numbers[3],numbers[4],numbers[5],numbers[6],numbers[7],numbers[8],numbers[9],numbers[10],numbers[11],numbers[12],numbers[13],numbers[14],numbers[15],numbers[16],numbers[17],numbers[18],numbers[19]));
           final sp = await SharedPreferences.getInstance();sp.setString('last4days','1888-06-24 00:00:00.000');
  */
 
  

