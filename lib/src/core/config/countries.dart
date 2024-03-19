import 'package:flutter/material.dart';
import 'package:breeds/src/shared/models/country/country.dart';
import 'package:breeds/src/shared/models/country/documents.dart';
import 'package:breeds/src/shared/models/country/lat_long.dart';
import 'package:breeds/src/shared/models/country/loca_le.dart';
import 'package:breeds/src/core/utils/helpers/price_formatter/utils/compact_format_type.dart';
import 'package:breeds/src/core/utils/helpers/price_formatter/utils/price_formatter_settings.dart';

class Countries {
  const Countries({
    required this.config,
  });

  final Map<String, dynamic> config;

  List<Country> get all {
    debugPrint('--------- ${config['environment']} ---------');
    return [
      Country(
        code: 'CO',
        name: 'Colombia',
        logo: 'assets/icons/flags/co.png',
        currency: '\$',
        currencyName: 'COP',
        currencyNameText: 'peso colombiano',
        api: (config['api'] as Map)['co'],
        digits: 10,
        prefix: '+57',
        locale: const Locale(
          languageCode: 'es',
          countryCode: 'CO',
        ),
        currencyDecimal: 0,
        productIva: true,

        b2b: true,
        b2c: true,
        centerPoint: LatLong(
          latitude: 4.6961087,
          longitude: -74.1786334,
        ), //remoteConfig
        clientDocuments: const [
          DocumentType(
            value: 'NIT',
            text: 'NIT',
            keyValue: 'nit',
          ),
          DocumentType(
              value: 'CC',
              text: 'Cédula de ciudadanía',
              keyValue: 'cedula_ciudadania'),
          DocumentType(
            value: 'CE',
            text: 'Cédula de Extranjería y Pasaporte',
            keyValue: 'pasaporte',
          ),
        ],
        mapsKey: 'AIzaSyCtMJW8jxSydnrhZ6-B9KES4uJf-CUQDR4',
        priceSettings: PriceFormatterSettings(
          symbol: '\$',
          thousandSeparator: '.',
          decimalSeparator: '.',
          symbolAndNumberSeparator: '',
          fractionDigits: 0,
          compactFormatType: CompactFormatType.long,
        ),
      ),
    ];
  }
}
