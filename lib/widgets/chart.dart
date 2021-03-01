import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        var totleSum = 0.0;
        for (var item in recentTransactions) {
          if (item.date.day == weekDay.day &&
              item.date.month == weekDay.month &&
              item.date.year == weekDay.year) {
            totleSum += item.amount;
          }
        }

        return {
          "day": DateFormat.E().format(weekDay).substring(0, 1),
          "amount": totleSum,
        };
      },
    );
  }

  double get totleSpending {
    return groupedTransactionValues.fold(
      0.0,
      (previousValue, element) {
        return previousValue + element['amount'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                lablel: e['day'],
                spendingAmount: e['amount'],
                spendingPctOfTotle: totleSpending == 0.0
                    ? 0.0
                    : (e['amount'] as double) / totleSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
