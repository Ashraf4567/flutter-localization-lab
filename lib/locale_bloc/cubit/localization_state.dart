import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
sealed class LocalizationState extends Equatable {
  const LocalizationState();

  // Base fallback — overridden by LocalizationLoaded
  Locale get locale => const Locale('en');

  @override
  List<Object?> get props => [];
}

final class LocalizationInitial extends LocalizationState {
  const LocalizationInitial();
  // inherits locale => Locale('en') from base
}

final class LocalizationLoaded extends LocalizationState {
  final String localeCode;
  const LocalizationLoaded(this.localeCode);

  @override
  Locale get locale => Locale(localeCode);

  @override
  List<Object?> get props => [localeCode];
}