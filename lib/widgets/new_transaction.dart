import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime chosenDate;

  void submitData() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0 || chosenDate == null) {
      return;
    }
    widget._addTransaction(title, amount, chosenDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          chosenDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    chosenDate == null
                        ? 'No date chosen!'
                        : DateFormat.yMd().format(chosenDate),
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Choose date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: _showDatePicker,
                )
              ],
            ),
            RaisedButton(
                child: Text(
                  'Add transaction',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.button.color,
                  ),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: submitData),
          ],
        ),
      ),
    );
  }
}
