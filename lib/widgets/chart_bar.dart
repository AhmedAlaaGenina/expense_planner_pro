import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lablel;
  final double spendingAmount;
  final double spendingPctOfTotle;

  const ChartBar({this.lablel, this.spendingAmount, this.spendingPctOfTotle});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Column(
          children: [
            Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  "\$${spendingAmount.toStringAsFixed(0)}",
                ),
              ),
            ),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            Container(
              height: constrains.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotle,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  "$lablel",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
