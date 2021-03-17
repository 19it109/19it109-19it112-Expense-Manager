import 'package:Expense_manager/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class Pages extends StatelessWidget {
  final List<Transaction> transaction;

  Pages(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: RaisedButton(
          elevation: 0.0,
          color: Colors.white,
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyApp())),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        //backgroundColor: Colors.white,
        title: Text(
          "Expense",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            margin: EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: transaction.map((e) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: e.icons,
                          title: Text(
                            e.label,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text(
                              DateFormat().add_MMMMEEEEd().format(e.dateTime)),
                          trailing: Text(
                            "\u{20B9}${e.amount}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
