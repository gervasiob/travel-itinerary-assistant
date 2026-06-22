import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:juntoz/theme.dart';
import 'package:juntoz/nav.dart';
import 'package:juntoz/services/trip_service.dart';
import 'package:juntoz/services/card_service.dart';
import 'package:juntoz/services/document_service.dart';
import 'package:juntoz/services/list_service.dart';
import 'package:juntoz/services/sandbox_service.dart';
  import 'package:juntoz/services/trip_places_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:juntoz/firebase_options.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:juntoz/l10n/app_localizations.dart';
import 'package:juntoz/auth/auth_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Inicializa datos de localización para idiomas soportados.
    await Future.wait([
      initializeDateFormatting('es'),
      initializeDateFormatting('en'),
      initializeDateFormatting('pt'),
      initializeDateFormatting('zh'),
    ]);

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    // No bloqueamos el arranque de la app si Firebase falla; registramos el error para debug.
    debugPrint('Init error (intl/Firebase): $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState()),
        ChangeNotifierProvider(create: (_) => TripService()),
        ChangeNotifierProvider(create: (_) => CardService()),
        ChangeNotifierProvider(create: (_) => DocumentService()),
        ChangeNotifierProvider(create: (_) => ListService()),
        ChangeNotifierProvider(create: (_) => SandboxService()),
        ChangeNotifierProvider(create: (_) => TripPlacesService()),
      ],
      child: Builder(
        builder: (context) => MaterialApp.router(
          title: 'Travel Itinenary App',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('es'),
            Locale('en'),
            Locale('pt'),
            Locale('zh'),
          ],
          localeResolutionCallback: (locale, supported) {
            final lang = locale?.languageCode;
            final match = supported.firstWhere(
              (l) => l.languageCode == lang,
              orElse: () => const Locale('en'),
            );
            // Ajusta Intl al locale activo para formatos de fecha/número.
            Intl.defaultLocale = match.languageCode;
            return match;
          },
          routerConfig: AppRouter.router(context.read<AuthState>()),
        ),
      ),
    );
  }
}
