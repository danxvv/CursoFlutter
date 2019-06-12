import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_paga.dart';

Map<String,WidgetBuilder> getApplicationRoutes(){

return <String, WidgetBuilder>{
        '/'       : (BuildContext context) => HomePage(),
        'alert'   : (BuildContext context) => AlertPage(),
        'avatar'  : (BuildContext context) => AvatarPage(),
      };

}