import 'package:flutter/material.dart';

const Map<int, List<String>> indexFilterMap = {
  0: transportTX,
  1: foodTX,
  2: martTX,
  3: financeTX,
};

const List<String> transportTX = [
  "redONE HQ to KL Sentral",
  "KL Sentral to IOI Puchong Mall",
  "redONE HQ to KL Sentral",
];

const List<String> foodTX = [
  "KFC - IOI Puchong Mall",
  "Hai Di Lao - IOI Puchong Mall",
  "ZUS - IOI Puchong Mall",
  "GIGI Coffee - IOI Puchong Mall",
];

const List<String> martTX = [];

const List<String> financeTX = [
  "Transfer to Boon Wee",
  "Golden Screen Cinemas Sdn Bhd",
  "Top-up to GrabPay Wallet",
  "BEMED TEMPUA SDN. BHD.",
  "KK MART",
  "JIA XIANG GROUP 1 SDN BHD",
];

class Ans1 extends StatefulWidget {
  const Ans1({super.key});

  static route(BuildContext context) => MaterialPageRoute(builder: (context) => const Ans1());

  @override
  State<Ans1> createState() => _Ans1State();
}

class _Ans1State extends State<Ans1> {
  // Filters
  List<String> filters = ["Transport", "Food", "Mart", "Finance", "Express", "Gifts", "Bank"];
  int selectedFilter = 0;
  // default to transport
  List<String> selectedList = transportTX;

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...filters.asMap().entries.map((e) {
                    return GestureDetector(
                      onTap: () {
                        selectedFilter = e.key;
                        selectedList = indexFilterMap[selectedFilter] ?? [];
                        setState(() {});
                      },
                      child: HistoryFilterButton(
                        label: e.value,
                        selected: selectedFilter == e.key,
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: selectedList.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.emoji_people,
                            size: 150,
                            color: Color.fromARGB(255, 49, 78, 50),
                          ),
                          Text(
                            "It's Empty Here",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 49, 78, 50),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      children: List.generate(
                        selectedList.length,
                        (index) {
                          String element = selectedList[index];
                          return TransactionTile(
                            icon: Icons.arrow_outward,
                            transaction: element,
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
  final bool selected;
  const HistoryFilterButton({
    required this.label,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: selected ? SelectedFilterBG(label: label) : UnselectedFilterBG(label: label),
    );
  }
}

class SelectedFilterBG extends StatelessWidget {
  final String label;
  const SelectedFilterBG({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 49, 78, 50),
        borderRadius: BorderRadius.all(
          Radius.circular(
            18,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 239, 251, 252),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class UnselectedFilterBG extends StatelessWidget {
  final String label;
  const UnselectedFilterBG({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 239, 251, 252),
        borderRadius: BorderRadius.all(
          Radius.circular(
            18,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          label,
          style: const TextStyle(
            color: const Color.fromARGB(255, 40, 78, 41),
            fontWeight: FontWeight.w800,
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
