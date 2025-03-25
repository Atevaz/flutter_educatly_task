import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors/app_colors.dart';
import '../../repository/global/global_repository.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  Locale locale = const Locale("en");
  late bool isGlobalEng;
  bool firstUse = false;

  ThemeMode appMode = ThemeMode.dark;
  bool isDark = true;

  Color backgroundColor = AppColor.backgroundColorLight ;
  Color textColor = AppColor.textColorLight ;
  Color inputColor = AppColor.inputColorLight ;
  final GlobalRepository globalRepository;

  GlobalCubit({required this.globalRepository}) : super(GlobalInitialState());
  static GlobalCubit get(context) => BlocProvider.of(context);

  Future<void> initApp() async {
    firstUse = await globalRepository.appFirstUse();
    final sysLocale = _getSysLocale();
    final myLocale = await globalRepository.appLang();
    locale = myLocale ?? sysLocale;
    isGlobalEng = locale.languageCode == 'en';
    await _updateAppLocale();

    final sysIsDark = _getSysThemeMode();
    final myIsDark = await globalRepository.isDarkMode();
    isDark = myIsDark ?? sysIsDark;
    _updateCurrentMode();
    await _updateAppMode();
  }

  Locale _getSysLocale() {
    final sysLocalName = Platform.localeName;
    if (sysLocalName.contains('ar')) {
      return const Locale('ar', 'EG');
    }
    return const Locale('en', 'US');
  }

  Future<void> changeAppLocale() async {
    locale = locale == const Locale('ar', 'EG')
        ? const Locale('en', 'US')
        : const Locale('ar', 'EG');
    isGlobalEng = locale.languageCode == 'en' ? true : false;
    emit(ChangeLanguageState());
    await _updateAppLocale();
  }

  Future _updateAppLocale() async {
    final result = await globalRepository.saveLang(locale: locale.languageCode);
    result.fold((l) {
      emit(AppLocaleSaveErrorState(l));
    }, (r) {
      emit(AppLocaleSavedState());
    });
  }

  bool _getSysThemeMode() {
    final sysThemeMode = SchedulerBinding.instance.window.platformBrightness;
    if (sysThemeMode == Brightness.light) {
      return false;
    }
    return true;
  }

  void _updateCurrentMode() {
    if (isDark) {
      backgroundColor = AppColor.backgroundColorDark ;
      textColor = AppColor.textColorDark ;
      inputColor = AppColor.inputColorDark ;
      appMode = ThemeMode.dark;
      emit(AppChangeModeDarkState());
    } else {
      backgroundColor = AppColor.backgroundColorLight ;
      textColor = AppColor.textColorLight ;
      inputColor = AppColor.inputColorLight ;
      appMode = ThemeMode.light;
      emit(AppChangeModeLightState());
    }
  }

  Future<void> changeAppMode() async {
    isDark = !isDark;
    _updateCurrentMode();
    await _updateAppMode();
  }

  Future _updateAppMode() async {
    final result = await globalRepository.saveMode(isDark: isDark);
    result.fold((l) {
      emit(AppModeSaveErrorState(l));
    }, (r) {
      emit(AppModeSavedState());
    });
  }

}


