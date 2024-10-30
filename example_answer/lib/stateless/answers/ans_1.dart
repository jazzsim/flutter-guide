import 'package:flutter/material.dart';

class Ans1 extends StatelessWidget {
  const Ans1({super.key});

  static route(BuildContext context) => MaterialPageRoute(
        builder: (context) => const Ans1(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Transaction Details",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10.0, 0, 10.0),
              child: Text(
                "Payment",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const FlatCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You've paid",
                  style: TextStyle(
                    color: Color.fromARGB(255, 116, 114, 114),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.0,
                        right: 5.0,
                      ),
                      child: Text(
                        "RM",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "33.80",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            )),
            const SizedBox(height: 20),
            FlatCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextPairRowWidget(
                    title: "Paid to",
                    content: "BEMED TEMPUA SDN. BHD.",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextPairRowWidget(
                    title: "Paid by",
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.green,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: const Icon(
                        Icons.g_mobiledata,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    content: "GrabPay Wallet",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextPairRowWidget(
                    title: "Date and time",
                    content: "31 Jul 2024, 12:47 PM",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextPairRowWidget(
                    title: "Service Provider",
                    content: "DuitNow QR",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const FlatCard(
              smallPadding: true,
              child: TextPairColumnWidget(
                title: "Transaction ID",
                content: "758fdd8528a142da8233e6ba6b583fa8",
              ),
            ),
            const SizedBox(height: 20),
            const FlatCard(
              smallPadding: true,
              child: TextPairColumnWidget(
                title: "DuitNow QR Transaction ID",
                content: "758fdd8528a142da8233e6ba6b583fa8",
              ),
            ),
            const SizedBox(height: 20),
            const FlatCard(
              smallPadding: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Report an issue",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                    size: 35,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlatCard extends StatelessWidget {
  final Widget child;
  final bool smallPadding;
  const FlatCard({required this.child, this.smallPadding = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: smallPadding ? 10.0 : 25.0,
          horizontal: 10.0,
        ),
        child: child,
      ),
    );
  }
}

class TextPairRowWidget extends StatelessWidget {
  final String title;
  final Widget? icon;
  final String content;
  const TextPairRowWidget({required this.title, this.icon, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 116, 114, 114),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: 5),
            Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TextPairColumnWidget extends StatelessWidget {
  final String title;
  final String content;
  const TextPairColumnWidget({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 116, 114, 114),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            color: const Color.fromARGB(216, 35, 34, 34),
            child: const Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
