// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final int randomInt;

  const ChangeThemeEvent({
    required this.randomInt,
  });

  @override
  String toString() => 'ChangeThemeEvent(randomInt: $randomInt)';

  @override
  List<Object> get props => [randomInt];
}
