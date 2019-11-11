import 'dart:math';

import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function removeTx;

  TransactionItem({
    Key key,
    @required this.removeTx,
    @required this.transaction,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TransactionItemState();
  }
}

class TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.purple,
      Colors.grey,
      Colors.red,
      Colors.yellow,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => widget.removeTx(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.removeTx(widget.transaction.id),
              ),
      ),
    );
  }
}
