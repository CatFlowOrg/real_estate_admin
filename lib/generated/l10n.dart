// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_admin/generated/intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settings_title {
    return Intl.message('Settings', name: 'settings_title', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Total Revenue`
  String get total_revenue {
    return Intl.message(
      'Total Revenue',
      name: 'total_revenue',
      desc: '',
      args: [],
    );
  }

  /// `Total Agents`
  String get total_agents {
    return Intl.message(
      'Total Agents',
      name: 'total_agents',
      desc: '',
      args: [],
    );
  }

  /// `Admin Panel`
  String get admin_panel {
    return Intl.message('Admin Panel', name: 'admin_panel', desc: '', args: []);
  }

  /// `Real Estates`
  String get real_estate {
    return Intl.message(
      'Real Estates',
      name: 'real_estate',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message('Tasks', name: 'tasks', desc: '', args: []);
  }

  /// `Search agents...`
  String get agent_search_hint {
    return Intl.message(
      'Search agents...',
      name: 'agent_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Agent filters go here`
  String get agent_filters_placeholder {
    return Intl.message(
      'Agent filters go here',
      name: 'agent_filters_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get error_generic {
    return Intl.message(
      'An error occurred',
      name: 'error_generic',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get no_data {
    return Intl.message(
      'No data available',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Filter options here`
  String get filter_options {
    return Intl.message(
      'Filter options here',
      name: 'filter_options',
      desc: '',
      args: [],
    );
  }

  /// `Real Estate Details`
  String get real_estate_details {
    return Intl.message(
      'Real Estate Details',
      name: 'real_estate_details',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'sr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
