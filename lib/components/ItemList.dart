import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String label;
  final String nome;
  final String cargo;
  final String nivel;
  final Function() onPressedEdit;
  final Function() onPressedEditDelete;
  const ItemList({
    Key? key,
    required this.label,
    required this.nome,
    required this.cargo,
    required this.nivel,
    required this.onPressedEdit,
    required this.onPressedEditDelete,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.5),
                Text(
                  cargo,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.5),
                Text(nivel),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.blue,
                  onPressed: () {
                    onPressedEdit();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    onPressedEditDelete();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}
