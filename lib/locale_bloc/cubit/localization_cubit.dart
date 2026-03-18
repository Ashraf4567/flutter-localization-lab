import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_lab/core/data/local_repo.dart';
import 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  final LocalRepo _localRepo;

  LocalizationCubit({required LocalRepo localRepo})
    : _localRepo = localRepo,
      super(const LocalizationInitial()) {
    getLocale();
  }

  Future<void> setLocale(Locale locale) async {
    await _localRepo.setLocaleCode(locale.languageCode);
    emit(LocalizationLoaded(locale.languageCode));
  }

  Future<void> getLocale() async {
    final localeCode = await _localRepo.getLocaleCode();
    emit(LocalizationLoaded(localeCode ?? 'ar'));
  }
}
