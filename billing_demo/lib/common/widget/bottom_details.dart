import 'package:flutter/material.dart';

class BottomDetails extends StatelessWidget {
  const BottomDetails(
      {required this.blockNum,
      required this.address,
      required this.report,
      required this.actionTaken,
      super.key});

  final String blockNum;
  final String address;
  final String report;
  final String actionTaken;
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Container(
        width: 700,
        padding: const EdgeInsets.all(80),
        child: Table(
          children: [
            TableRow(children: [
              const Text(
                "No Blok",
                textScaleFactor: 1.5,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(blockNum,
                  textScaleFactor: 1.5,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(169, 169, 169, 169),
                  ),
                  textAlign: TextAlign.end),
            ]),
            const TableRow(children: [
              Text(
                "",
                textScaleFactor: 1.5,
              ),
              Text(
                "",
                textScaleFactor: 1.5,
              ),
            ]),
            TableRow(children: [
              const Text(
                "Alamat Rumah",
                textScaleFactor: 1.5,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(address,
                  textScaleFactor: 1.5,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(169, 169, 169, 169),
                  ),
                  textAlign: TextAlign.end),
            ]),
            const TableRow(children: [
              Text(
                "",
                textScaleFactor: 1.5,
              ),
              Text(
                "",
                textScaleFactor: 1.5,
              ),
            ]),
            TableRow(children: [
              const Text(
                "Keterangan",
                textScaleFactor: 1.5,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(report,
                  textScaleFactor: 1.5,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(169, 169, 169, 169),
                  ),
                  textAlign: TextAlign.end),
            ]),
            const TableRow(children: [
              Text(
                "",
                textScaleFactor: 1.5,
              ),
              Text(
                "",
                textScaleFactor: 1.5,
              ),
            ]),
            TableRow(children: [
              const Text(
                "Tindakan",
                textScaleFactor: 1.5,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(actionTaken,
                  textScaleFactor: 1.5,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(169, 169, 169, 169),
                  ),
                  textAlign: TextAlign.end),
            ]),
          ],
        ));
  }
}
