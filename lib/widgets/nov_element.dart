import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';

import 'package:listview1/model/list_item.dart';

class NovElement extends StatefulWidget {
  final Function addItem;

  NovElement(this.addItem);
  @override
  State<StatefulWidget> createState() => _NovElementState();
}

class _NovElementState extends State<NovElement> {
  final _naslovController = TextEditingController();
  final _vrednostController = TextEditingController();

  String imePredmet = " ";
  DateTime datumVreme = DateTime.now();

  void _submitData() {
    if (_vrednostController.text.isEmpty) {
      return;
    }
    final vnesenPredmet = _naslovController.text;
    final vnesenDatum = DateTime.parse(_vrednostController.text);

    if (vnesenPredmet.isEmpty ||
        (vnesenDatum.isBefore(DateTime.now()) ||
            vnesenDatum.isAtSameMomentAs(DateTime.now()))) {
      return;
    }

    final newItem = ListItem(
        id: nanoid(5), imePredmet: vnesenPredmet, datumVreme: vnesenDatum);
    widget.addItem(context, newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _naslovController,
            decoration: InputDecoration(labelText: "Ime na predmet"),
            //  onChanged: (val) {
            //    naslov = val;
            //  }
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _vrednostController,
            decoration: InputDecoration(labelText: "YYYY-MM-DD HH:mm:ss"),
            keyboardType: TextInputType.number,
            //  onChanged: (val) {
            //    naslov = val;
            //  }
            onSubmitted: (_) => _submitData(),
          ),
          FlatButton(
            child: Text("Dodaj"),
            onPressed: _submitData,
          ),
        ],
      ),
    );
  }
}
