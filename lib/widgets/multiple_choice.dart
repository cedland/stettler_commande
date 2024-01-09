import 'package:flutter/material.dart';

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key, required this.items});

  final List<String> items;

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
      child: ListBody(
        children: widget.items
            .map(
              (item) => CheckboxListTile(
                value: _selectedItems.contains(item),
                title: Text(
                  item,
                  style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                ),
                onChanged: (isChecked) => false
              ),
            )
            .toList(),
      ),
    );
  }
}
