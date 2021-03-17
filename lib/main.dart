import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Models/transaction.dart';
import 'Widgets/allMoths.dart';
import 'Widgets/firstCard.dart';
import 'Widgets/newTransaction.dart';
import 'Widgets/secondCard.dart';
import 'Widgets/transactionList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransaction = [];

  void _addTransaction(String label, double amount) {
    var addTx = Transaction(
      label: label,
      amount: amount.toString(),
      dateTime: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(addTx);
    });
  }

  void _addNewTransactionModel(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addNewTransactionModel(context),
          ),
        ],
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "DashBroad",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirstCard(_userTransaction),
            AllMonths(),
            SecondCard(),
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewTransactionModel(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
