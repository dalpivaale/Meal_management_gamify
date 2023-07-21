 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basic_navigation/database/entities/event.dart';
import 'package:basic_navigation/database/entities/level.dart';
import 'package:basic_navigation/repositories/databaseRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:basic_navigation/repositories/databaseRepository.dart';
import 'package:provider/provider.dart';
import 'package:basic_navigation/utils/event_data_source.dart';



 class Metodi {

 static List<Event> _bubbleSort (List<Event> eventi){ // ordinamento Crescente
    int N = eventi.length;
    bool Scambio=true; // Indica se durante una scansione si è verificato almeno uno scambio
    Event Temp; int Ultimo= N-1 ; // posizione dell’elemento limite di ogni scansione
    while (Scambio==true){ // L’algoritmo continua fintantoché c’è stato almeno uno scambio durante
 // l’ultima scansione
// inizio nuova scansione
    Scambio=false;
    for (int i=0; i<Ultimo; i++){
       if (eventi[i].from.difference(eventi[i+1].from).inDays > 0){
       // scambia e imposta la variabile booleana a true
          Temp= eventi[i];
          eventi[i] = eventi[i+1];
          eventi[i+1]=Temp;
          Scambio=true;
        }
}
Ultimo--; // Alla successiva scansione ci si può fermare alla posizione precedente
}
return eventi;
}

static setLevel(BuildContext context) async{
     List<Event> colazioni = []; 
     List<Event> pranzo = []; 
     List<Event> cena = []; 
    List<Event> snack = []; 
    var eventi =   await Provider.of<DatabaseRepository>(context, listen: false).findAllEvents();
   // if(eventi.isEmpty){
     await Provider.of<DatabaseRepository>(context, listen: false).insertLevel(Level(null, 0, 0, 1));//} //se l'utente non ha caricato niente o è la prima volta che apre l'app devo caricare il livello

    var Livello =  await Provider.of<DatabaseRepository>(context, listen: false).findAllLevels();

   eventi = _bubbleSort(eventi);
   int countc = 1;
   int countp = 1;
   int countC = 1;
   int counts = 1;
   double a = 1;
   double counter = 0;
   double livello = 0;
   int j = -1;
   int k = -1;
   int l = -1;
   int m = -1;
   double remove = 0;

   for(int i = 0; i < eventi.length;i++){
    if( i > 0 && (eventi[i].from.difference(eventi[i-1].from)).inDays > 6){
       remove = counter;
        while(remove < 500 && livello >= 0){
            counter = (a*200)-50;
            remove = remove + counter;
            a = a-0.25;
            livello--; 
          //  print(remove);//in realtà  dovresti fare la roba col floor()
        }
        counter = remove -500;
        if(livello < 0){
          livello = 0;
          counter = 0;
        }
        print('remove 500');
    }

    else{
       counter = counter +50;
      if(eventi[i].colazione != ''){ //TRIGGER 4GG COLAZIONE
        colazioni.add(eventi[i]);
        j++;
     
         if( colazioni.length > 1 && (colazioni[j].from.difference(colazioni[j-1].from)).inDays == 1)
            countc++;
         else 
            countc = 1;

         if(countc%4 == 0){
          print('+100 colazione');      
         // if( sp.getString('lastColazione') == null ||sp.getString('lastColazione') != colazioni[j].from.toString()){   
           //    ScaffoldMessenger.of(context).showSnackBar(snackBar);sp.setString('lastColazione',colazioni[j].from.toString());}
          
          counter = counter +100;}  
     }
    
    if(counter >= (a*200)){
        livello++; 
        counter = counter-(a*200);
        a = a+0.25;}

  //TRIGGER 4GG PRANZO
        if(eventi[i].pranzo1 != '' || eventi[i].pranzo2 != '' || eventi[i].pranzo3 != '' || eventi[i].pranzo4 != ''){ 
        pranzo.add(eventi[i]);
        k++;
     
         if( pranzo.length > 1 && (pranzo[k].from.difference(pranzo[k-1].from)).inDays == 1)
            countp++;
         else 
            countp = 1;

         if(countp%4 == 0){
          print('+100 pranzo');
          counter = counter +100;}  
     }
    
    if(counter >= (a*200)){
        livello++; 
        counter = counter-(a*200);
        a = a+0.25;}
  
  //---TRIGGER 4GG CENA
    if(eventi[i].cena1 != '' || eventi[i].cena2 != '' || eventi[i].cena3 != '' || eventi[i].cena4 != ''){ 
        cena.add(eventi[i]);
        l++;
     
         if( cena.length > 1 && (cena[l].from.difference(cena[l-1].from)).inDays == 1)
            countC++;
         else 
            countC = 1;

         if(countC%4 == 0){
          print('+100 cena');
          counter = counter +100;}  
     }
    
    if(counter >= (a*200)){
        livello++; 
        counter = counter-(a*200);
        a = a+0.25;}

   //---TRIGGER 4GG SNACK
    if(eventi[i].snack != ''){ 
        snack.add(eventi[i]);
        m++;
     
         if( snack.length > 1 && (snack[m].from.difference(snack[m-1].from)).inDays == 1)
            counts++;
         else 
            counts = 1;

         if(counts%4 == 0){
          print('+100 snack');
          counter = counter +100;}  
     }
    
    if(counter >= (a*200)){
        livello++; 
        counter = counter-(a*200);
        a = a+0.25;}
     
  } 

  } //else      
  print('counter: ' + counter.toString() + '    livello: ' + livello.toString()); 
  
    await Provider.of<DatabaseRepository>(context, listen: false).updateLevel(Level(Livello[0].id, counter, livello, a));



}
 }