// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void changeTheme(int randomInt) {
    emit(state.copyWith(
      appTheme: randomInt.isEven ? AppTheme.light : AppTheme.dark,
    ));
  }
}
