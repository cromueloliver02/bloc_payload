import 'dart:math' as math;

import 'package:bloc_payload/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (ctx) => ThemeBloc(),
      child: BlocSelector<ThemeBloc, ThemeState, AppTheme>(
        selector: (state) => state.appTheme,
        builder: (ctx, appTheme) {
          return MaterialApp(
            title: 'Bloc Payload',
            debugShowCheckedModeBanner: false,
            theme: appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onChangeTheme(BuildContext ctx) {
    final bloc = ctx.read<ThemeBloc>();
    final randInt = math.Random().nextInt(10);

    bloc.add(ChangeThemeEvent(randomInt: randInt));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _onChangeTheme(context),
          child: const Text(
            'Change Theme',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
