import 'package:flutter/material.dart';


class ThemeChanger extends ChangeNotifier {

   int index ;

   set setIndex(int index) {
     this.index = index;
     notifyListeners();
   }

   get getIndex  {
//     index= await getIntFromShP();
     return index;
   }


}