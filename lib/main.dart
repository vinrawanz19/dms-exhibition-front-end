import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:indomobil_exhibition_front_end/screens/form_screen.dart';
import 'package:indomobil_exhibition_front_end/screens/login_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      name: "Form Screen",
      path: '/:company',
      builder: (BuildContext context, GoRouterState state) {
        return FormScreen(path: state.uri.pathSegments.first);
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginScreen(path: state.uri.pathSegments.first);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Exhibition Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
