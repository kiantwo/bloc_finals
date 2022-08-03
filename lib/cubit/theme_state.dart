import 'package:bloc_finals_exam/app_themes.dart';
import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final AppTheme? appTheme;

  const ThemeState({this.appTheme});

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  List<Object?> get props => [appTheme];
}
