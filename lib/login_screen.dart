import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_lab/locale_bloc/cubit/localization_cubit.dart';
import 'l10n/generated/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {

    final l10n = AppLocalizations.of(context)!;


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.loginTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: l10n.emailLabel,
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: l10n.passwordLabel,
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement login
                },
                child: Text(l10n.loginButton),
              ),
              SizedBox(height: 16),
              DropdownButton<Locale>(
                value: context.watch<LocalizationCubit>().state.locale,
                onChanged: (Locale? value) {
                  if(value!=null){
                    context.read<LocalizationCubit>().setLocale(value);

                  }
                },
                items: AppLocalizations.supportedLocales.map((Locale locale) {
                  return DropdownMenuItem<Locale>(value: locale, child: Text(locale.languageCode));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}