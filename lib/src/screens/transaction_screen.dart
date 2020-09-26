import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:span/src/models/transaction.dart';
import 'package:span/src/widgets/transaction_card.dart';

class TransactionScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = [
      Transaction(
          username: "Number 1",
          time: "2 days ego",
          content: "Lorem ipsum",
          amount: '2,000'),
      Transaction(
          username: "Number 2",
          time: "3 days ego",
          content: "Lorem ipsum",
          amount: '8,000'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionCard(
                      content: transactions[index].content,
                      username: transactions[index].username,
                      time: transactions[index].time,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
