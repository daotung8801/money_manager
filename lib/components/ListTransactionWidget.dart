import 'package:flutter/material.dart';
import 'package:money_manager/components/Transaction.dart';
import 'package:money_manager/components/TransactionContentWidget.dart';

class ListTransactionWidget extends StatelessWidget {
  final Future<List<Transaction>> transactions;

  ListTransactionWidget({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0,
      height: 310.0,
      child: FutureBuilder<List<Transaction>>(
        future: this.transactions,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TransactionContentWidget(
                    transaction: snapshot.data![index],
                  );
                });
          } else if (snapshot.hasError) {
            return Text("Error");
          } else {
            return CircularProgressIndicator();
            ;
          }
        },
      ),
    );
  }
}
