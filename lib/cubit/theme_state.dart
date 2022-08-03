import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool? isDarkTheme;

  const ThemeState({this.isDarkTheme});

  ThemeState copyWith({
    bool? isDarkTheme,
  }) {
    return ThemeState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }

  @override
  List<Object?> get props => [isDarkTheme];
}
