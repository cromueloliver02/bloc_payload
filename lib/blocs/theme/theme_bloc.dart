// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>(_changeTheme);
  }

  void _changeTheme(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) {
    final randInt = event.randomInt;

    emit(
      state.copyWith(appTheme: randInt.isEven ? AppTheme.light : AppTheme.dark),
    );
  }
}
