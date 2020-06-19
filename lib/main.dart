
import 'package:app_acomer/src/pages/detalle-page.dart';
import 'package:app_acomer/src/pages/home-page.dart';
import 'package:app_acomer/src/pages/restaurante-page.dart';
import 'package:app_acomer/src/pages/restaurante/platos-restaurante.dart';
import 'package:app_acomer/src/providers/carrito-provider.dart';
import 'package:app_acomer/src/providers/categoria-provider.dart';
import 'package:app_acomer/src/providers/clientes-provider.dart';
import 'package:app_acomer/src/providers/platos-provider.dart';
import 'package:app_acomer/src/providers/restaurantes-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((_) {
     runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlatoProvider(),),
        ChangeNotifierProvider(create: (_) => ClienteProvider(),),
        ChangeNotifierProvider(create: (_) => RestauranteProvider()),
        ChangeNotifierProvider(create: (_) => CarritoProvider()),
        ChangeNotifierProvider(create: (_) => CategoriaProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ACOMER',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(254, 182, 24, 1.0),
          secondaryHeaderColor: Colors.white,
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.white,
                fontSize: 22
              ) 
            )
          ),
          dividerTheme: DividerThemeData(
            color: Color.fromRGBO(254, 182, 24, 1.0),
            thickness: 2,
          ),
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            buttonColor: Color.fromRGBO(14, 70, 85, 1.0),
          ),
          bottomAppBarColor: Color.fromRGBO(254, 182, 24, 1.0),
          accentColor: Color.fromRGBO(14, 70, 85, 1.0),
          primaryColorLight: Color.fromRGBO(236, 233, 222, 1),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (BuildContext ct) => HomePage(),
          'detalle': (BuildContext ct) => DetallePage(idPlato: 1,),
        },
      ),
    );
  }
}
