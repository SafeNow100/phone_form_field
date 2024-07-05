import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import 'country.dart';

final allCountries = IsoCode.values

    /// those 3 (small) islands dont have flags in the circle_flags library
    /// it's unlikely anyone with a phone will be from there anyway
    /// those will be added when added to the circle_flags library
    .where((iso) => iso != 'AC' && iso != 'BQ' && iso != 'TA')
    .map((iso) => Country(iso))
    .toList();
