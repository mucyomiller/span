class Transaction {
  final String username;
  final String content;
  final String time;
  final String amount;

  Transaction({this.username, this.content, this.time, this.amount});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      username: json['username'],
      content: json['body'],
      time: "json['title']",
      amount: "json['amount']",
    );
  }
}
