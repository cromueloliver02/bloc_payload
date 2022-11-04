import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/theme/theme_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
      child: BlocSelector<ThemeCubit, ThemeState, AppTheme>(
        selector: (state) => state.appTheme,
        builder: (ctx, appTheme) => MaterialApp(
          title: 'Bloc Payload',
          debugShowCheckedModeBanner: false,
          theme:
              appTheme == AppTheme.light ? ThemeData.light() : ThemeData.dark(),
          home: const HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onChangeTheme(BuildContext ctx) {
    final bloc = ctx.read<ThemeCubit>();
    final randInt = math.Random().nextInt(10);

    bloc.changeTheme(randInt);
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
