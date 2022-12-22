import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oyt_front_table/models/tables_socket_response.dart';

class TableGridCard extends StatelessWidget {
  const TableGridCard({
    super.key,
    required this.item,
    required this.isCallingTable,
    required this.onSelectTable,
  });

  final TableResponse item;
  final bool isCallingTable;
  final void Function(TableResponse item) onSelectTable;

  static const gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 3 / 2,
    crossAxisSpacing: 15,
    mainAxisSpacing: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.3),
      color: item.status.color,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => onSelectTable(item),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mesa: ${item.name}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5, width: double.infinity),
                Text('${item.status.translatedValue}...'),
              ],
            ),
            if (isCallingTable)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(FontAwesomeIcons.bell, color: Colors.white, size: 15),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
