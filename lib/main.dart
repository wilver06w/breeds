import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:breeds/src/core/config/app.dart';
import 'package:breeds/src/core/config/module.dart';
import 'package:breeds/src/core/utils/load_file.dart';
import 'package:breeds/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final env = LoadConfigFile.getEnv();
  final configFile = await LoadConfigFile.load(env);

  await App.instance.init(
    config: configFile,
    environment: env,
  );

  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        title: 'CatBreeds!',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback: localeCallBack,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

Locale localeCallBack(Locale? locale, Iterable<Locale> supportedLocales) {
  if (locale == null) return supportedLocales.first;

  for (var supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale.languageCode &&
        supportedLocale.countryCode == locale.countryCode) {
      return supportedLocale;
    }
  }

  return supportedLocales.first;
}
