import 'package:flutter/material.dart';

class Ans2 extends StatelessWidget {
  const Ans2({super.key});

  static route(BuildContext context) => MaterialPageRoute(builder: (context) => const Ans2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
            ),
          ),
        ),
        centerTitle: false,
        title: const Text(
          "Activity History",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       HistoryFilterButton(label: "Transport"),
            //       HistoryFilterButton(label: "Food"),
            //       HistoryFilterButton(label: "Mart"),
            //       HistoryFilterButton(label: "Finance"),
            //       HistoryFilterButton(label: "Express"),
            //       HistoryFilterButton(label: "Gifts"),
            //       HistoryFilterButton(label: "Bank"),
            //     ],
            //   ),
            // ),
            Expanded(
              child: ListView(
                children: List.generate(
                  14,
                  (index) {
                    return const TransactionTile(
                      icon: Icons.arrow_outward,
                      transaction: "Transfer from Boon Wee",
                      datetime: "26 Jun 2024, 13:58",
                      amount: "RM11.00",
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

class HistoryFilterButton extends StatelessWidget {
  final String label;
  const HistoryFilterButton({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        backgroundColor: const Color.fromARGB(255, 239, 251, 252),
        label: Text(label),
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 40, 78, 41),
          fontWeight: FontWeight.w800,
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 0, color: Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(
              18,
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final IconData icon;
  final String transaction;
  final String datetime;
  final String amount;
  const TransactionTile({
    super.key,
    required this.icon,
    required this.transaction,
    required this.datetime,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            120,
          ),
          color: const Color.fromARGB(255, 239, 251, 252),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 68, 130, 70),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            transaction,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          datetime,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF606060),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
