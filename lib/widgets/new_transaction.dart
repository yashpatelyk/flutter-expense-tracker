import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if( title.isEmpty || amount <= 0 ) {
      return;
    }
    widget._addTransaction(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          FlatButton(
            child: Text(
              'Add transaction',
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: submitData

          ),
        ],
      ),
    );
  }
}
