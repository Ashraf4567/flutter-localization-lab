import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_lab/core/data/local_repo.dart';
import 'package:localization_lab/core/di.dart';
import 'package:localization_lab/locale_bloc/cubit/localization_cubit.dart';
import 'package:localization_lab/locale_bloc/cubit/localization_state.dart';
import 'package:localization_lab/login_screen.dart';
import 'package:localization_lab/strings.dart';
import 'l10n/generated/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocalizationCubit(localRepo: serviceLocator<LocalRepo>()),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        buildWhen: (previous, current) => previous.locale != current.locale,
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            builder: (context, child) {
              Strings.init(AppLocalizations.of(context)!);
              return child!;
            },
            locale: state.locale,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}