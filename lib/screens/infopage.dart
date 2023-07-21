import 'package:flutter/material.dart';
class InfoPage extends StatefulWidget{
    const InfoPage({Key? key}) : super(key: key);
  @override 
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage>{
@override 
  Widget build(BuildContext context) => Scaffold(
    body: 
      ListView( scrollDirection : Axis.vertical,
        children:[
                     Align(alignment: Alignment.topLeft,child: FloatingActionButton(onPressed:()=> Navigator.pop(context),child: Icon(Icons.arrow_back,color:Colors.white,size: 40),elevation: 0,backgroundColor: Color.fromARGB(0, 253, 6, 6),)),
         Align(alignment: Alignment.center,child: Text("IN ITALIANO " + '\n',style:TextStyle(fontSize: 15))),
        Container(   margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),
          child: Text(
                "Quest' app consente di tener traccia dei pasti che l'utente consuma giornalmente. Più pasti si tengono traccia più punti si acquisiscono per salire di livello. "
                + "L'obbiettivo è vincere più premi possibili (medaglie) e acquisire punti per arrivare in cima alla classifica"+
                " utenti." + '\n',style:TextStyle(fontSize: 15)),
        ),
        Text("   REGOLE: ",style:TextStyle(fontSize: 15)),
        Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),child: Text("-TRIGGER MEDAGLIE: vi sono quattro tipi di medaglie COLAZIONE,PRANZO,CENA,SNACK, per vincere una medaglia di un tipo l'utente deve caricare per 4 giorni di fila  i pasti di quel tipo: ad esempio per vincere una medaglia COLAZIONE bisogna inserire la colazione per 4 giorni di fila; per vincere una medaglia PRANZO bisogna inserire il pranzo per 4 giorni di file e così via.",style:TextStyle(fontSize: 15))),
        Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),child: Text("-TRIGGER PUNTI: Caricare uno o più pasti fa guadagnare di default 50 punti, ma caricare un pasto per 4 giorni di fila fa guadagnare 100 punti in aggiunta, che consentiranno a progredire di livello più velocemente."
        +'\n'+"Non caricare alcun pasto per 7 giorni consecutivi farà perdere ben 500 punti!",style:TextStyle(fontSize: 15))),
      
        Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),child: Text("-LEADERBOARD: è possibile vedere a che livello e punteggio sono altri utenti in una classifica (leaderboard). Coloro che sono ad un livello più alto arriveranno in testa.",style:TextStyle(fontSize: 15))),
        Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),child: Text("Ogni Giovedì la classifica assegnerà una medaglia bonus all'utente che arriva in cima alla classifica, solo così è possibile vincere questa tipologia di medaglia.",style:TextStyle(fontSize: 15))),
      //INGLESE
        Align(alignment: Alignment.center,child: Text("IN ENGLISH " + '\n',style:TextStyle(fontSize: 15))),
        Container(   margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),
          child: Text(
    "This app allows you to track the meals you consume on a daily basis. More meals you track, more points you acquire to level up."                + "The goal is to win as many rewards as possible (medals) and acquire points to reach the top of the ranking"+
                " utenti." + '\n',style:TextStyle(fontSize: 15)),
        ),
        Text("   RULES: ",style:TextStyle(fontSize: 15)),
        Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),child: Text("- MEDALS TRIGGER :there are four types of medals BREAKFAST, LUNCH, DINNER, SNACK, to win a medal of one type the user must load meals of that type for 4 days in a row: for example, to win a medal BREAKFAST you must enter breakfast for 4 days in a row; to win a LUNCH medal you have to enter lunch for 4 days in a row and so on.",style:TextStyle(fontSize: 15))),
        Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),child: Text("- POINTS TRIGGER: Loading one or more meals earns you 50 points by default, but loading a meal 4 days in a row earns you an additional 100 points, which will allow you to level up faster."
        +'\n'+"Not uploading any meals for 7 consecutive days will result in a loss of 500 points!",style:TextStyle(fontSize: 15))),
      
        Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),child: Text("-LEADERBOARD: you can see levels and scores of the others users in a leaderboard. Those who are at a higher level will come out on top.",style:TextStyle(fontSize: 15))),
        Container(margin: EdgeInsets.all(5), padding: EdgeInsets.all(5),child: Text("Every Thursday the ranking will award a bonus medal to the user who reaches the top of the ranking, only in this way it's possible to win this type of medal.",style:TextStyle(fontSize: 15))),
      ],)
    
  );

}