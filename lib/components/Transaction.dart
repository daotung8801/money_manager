class Transaction {
  final String categoryID;
  final String accountID;
  final String amount;
  final String date;
  final String? note;
  final String? image1;
  final String? image2;

  Transaction(this.categoryID, this.accountID, this.amount, this.date,
      this.note, this.image1, this.image2);

  factory Transaction.fromMap(Map<String, dynamic> json) {
    return Transaction(
      json['categoryID'],
      json['accountID'],
      json['amount'],
      json['date'],
      json['note'],
      json['image1'],
      json['image2'],
    );
  }
}
