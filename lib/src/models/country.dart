import 'package:dart_countries/dart_countries.dart' hide IsoCode;
import 'package:phone_numbers_parser/metadata.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

/// Country regroup informations for displaying a list of countries
class Country {
  /// Country code (ISO 3166-1 alpha-2)
  final IsoCode isoCode;

  /// English name of the country
  String get name => countriesName[isoCode]!;

  /// country dialing code to call them internationally
  String get countryCode => metadataByIsoCode[isoCode]!.countryCode;

  /// returns "+ [countryCode]"
  String get displayCountryCode => '+ $countryCode';

  Country(this.isoCode);

  @override
  bool operator ==(Object other) => identical(this, other) || other is Country && runtimeType == other.runtimeType && isoCode == other.isoCode;

  @override
  int get hashCode => isoCode.hashCode;

  @override
  String toString() {
    return 'Country{isoCode: ${isoCode.name}';
  }
}
