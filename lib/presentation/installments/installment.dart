class Installment {
  final double amount;
  final String dueDate;
  final String installmentChilddocName;
  final double paid;
  final double remainingAmount;
  final String dateOfFirstInstallment;
  final double total;
  final String feesItemName;

  Installment({
    required this.amount,
    required this.dueDate,
    required this.installmentChilddocName,
    required this.paid,
    required this.remainingAmount,
    required this.dateOfFirstInstallment,
    required this.total,
    required this.feesItemName,
  });

  factory Installment.fromJson(Map<String, dynamic> json) {
    return Installment(
      amount: json['amount']?.toDouble() ?? 0.0,
      dueDate: json['due_date'] ?? '',
      installmentChilddocName: json['installment_childdoc_name'] ?? '',
      paid: json['paid']?.toDouble() ?? 0.0,
      remainingAmount: json['remaining_amount']?.toDouble() ?? 0.0,
      dateOfFirstInstallment: json['date_of_first_installment'] ?? '',
      total: json['total']?.toDouble() ?? 0.0,
      feesItemName: json['fees_item_name'] ?? '',
    );
  }
}
