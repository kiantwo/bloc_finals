import 'package:bloc_finals_exam/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDarkTheme: false));

  void toggleTheme(bool isDarkTheme) {
    emit(state.copyWith(isDarkTheme: isDarkTheme));
  }
}
