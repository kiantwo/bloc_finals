import 'package:bloc_finals_exam/app_themes.dart';
import 'package:bloc_finals_exam/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(appTheme: AppTheme.lightMode));

  void toggleTheme(AppTheme appTheme) {
    emit(state.copyWith(appTheme: appTheme));
  }
}
