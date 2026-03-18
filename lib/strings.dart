import 'l10n/generated/app_localizations.dart';

class Strings {

  Strings._();

  static AppLocalizations? _loc;

  static void init(AppLocalizations loc) => _loc = loc;

  static String get loginTitle => _loc!.loginTitle;
  static String get emailLabel => _loc!.emailLabel;
  static String get passwordLabel => _loc!.passwordLabel;
  static String get loginButton => _loc!.loginButton;


}