import 'package:flutter/material.dart';

class AddSubtractWidget extends StatefulWidget {
  final int initialValue;
  final ValueChanged<Map> onChanged;

  const AddSubtractWidget({
    super.key,
    this.initialValue = 1,
    required this.onChanged,
  });

  @override
  AddSubtractWidgetState createState() => AddSubtractWidgetState();
}

class AddSubtractWidgetState extends State<AddSubtractWidget> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
    widget.onChanged({
      "qty": _quantity,
      "type": "add"
    }); // Notify parent widget about quantity change
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
      widget.onChanged({
        "qty": _quantity,
        "type": "sub"
      }); // Notify parent widget about quantity change
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Subtract Button
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decrementQuantity,
          ),
          // Quantity Display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              _quantity.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          // Add Button
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _incrementQuantity,
          ),
        ],
      ),
    );
  }
}