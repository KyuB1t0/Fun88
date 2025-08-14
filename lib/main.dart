import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun88/data/logic/bloc/session_bloc/session_bloc.dart';
import 'package:fun88/router/router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final sessionState = SessionState(prefs);
  sessionState.checkLoggedIn();
  sessionState.checkToken();

  runApp(MyApp(loginState: sessionState));
}

class MyApp extends StatefulWidget {
  final SessionState loginState;

  const MyApp({super.key, required this.loginState});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider<MyRouter>(
          lazy: false,
          create: ((context) => MyRouter(widget.loginState)),
        ),
        BlocProvider(create: (context) => SessionBloc()),
      ],
      child: Builder(
        builder: (context) {
          final router = Provider.of<MyRouter>(context, listen: false).router;
          return MaterialApp.router(
            theme: ThemeData(
              fontFamily: 'GeistSans',
              textTheme: const TextTheme(
                bodyMedium: TextStyle(fontSize: 16),
                headlineSmall: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            title: 'Maya Send Money',
          );
        },
      ),
    );
  }
}
