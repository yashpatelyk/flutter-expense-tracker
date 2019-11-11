import 'package:expense_tracker/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final removeTx;

  TransactionList(
    this._userTransactions,
    this.removeTx,
  );

  @override
  Widget build(BuildContext context) {
    final LayoutBuilder noTransactionMsg = LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Text(
              'No transaction added yet!',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: constraints.maxHeight * 0.7,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );

    return _userTransactions.length == 0
        ? noTransactionMsg
        : ListView(
            children: _userTransactions.map(
              (tx) {
                return TransactionItem(
                  key: ValueKey(tx.id),
                  removeTx: removeTx,
                  transaction: tx,
                );
              },
            ).toList(),
          );
  }
}
