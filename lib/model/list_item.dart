import 'package:flutter/foundation.dart';

class ListItem {
  final String id;
  final String imePredmet;
  final DateTime datumVreme;
  final String opis;

  ListItem({
    @required this.id,
    @required this.imePredmet,
    @required this.datumVreme,
    this.opis = "Ova e default opis",
  });
}
