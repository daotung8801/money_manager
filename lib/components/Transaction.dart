import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionDetails {
  final String id;
  final String categoryID;
  final String accountID;
  final int value;
  final String currencyunit;
  final Timestamp date;
  final bool isExpense;
  final String? description;
  final String? image1;
  final String? image2;

  TransactionDetails({required this.id, required this.categoryID, required this.accountID, required this.isExpense, required this.currencyunit, required this.value, required this.date,
    this.description, this.image1, this.image2});

  // factory TransactionDetails.fromMap(Map<String, dynamic> json) {
  //   return TransactionDetails(
  //     json['categoryID'],
  //     json['accountID'],
  //     json['value'],
  //     json['isExpense'],
  //     json['currencyunit'],
  //     json['date'],
  //     json['description'],
  //     json['image1'],
  //     json['image2'],
  //   );
  // }
}
