import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:juntoz/services/local_storage_service.dart';

class LanguageState extends ChangeNotifier {
  final LocalStorageService _storage;
  Locale? _locale;
  bool _initialized = false;

  LanguageState({LocalStorageService? storage}) : _storage = storage ?? LocalStorageService() {
    _init();
  }

  Locale? get locale => _locale;
  bool get initialized => _initialized;

  Future<void> _init() async {
    try {
      final code = await _storage.getLocaleCode();
      if (code != null && code.isNotEmpty) {
        _locale = Locale(code);
        Intl.defaultLocale = code;
      }
    } catch (e) {
      debugPrint('LanguageState init error: $e');
    } finally {
      _initialized = true;
      notifyListeners();
    }
  }

  Future<void> setLocale(String languageCode) async {
    try {
      _locale = Locale(languageCode);
      Intl.defaultLocale = languageCode;
      await _storage.setLocaleCode(languageCode);
    } catch (e) {
      debugPrint('LanguageState setLocale error: $e');
    } finally {
      notifyListeners();
    }
  }
}
