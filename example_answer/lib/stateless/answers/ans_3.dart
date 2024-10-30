import 'package:flutter/material.dart';

class Ans3 extends StatelessWidget {
  const Ans3({super.key});

  static route(BuildContext context) => MaterialPageRoute(builder: (context) => const Ans3());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 27, 11),
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              size: 28,
              color: Colors.white,
            ),
          ),
          centerTitle: false,
          title: const Text(
            "Additional Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomerFormField(
              title: "Contact Number*",
              hint: "Please enter contact number",
            ),
            const CustomerFormField(
              title: "Mother Maiden's Name",
              hint: "Please enter mother maiden's name",
            ),
            const CustomerFormField(
              title: "Email Address*",
              hint: "Please enter email address",
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Email validation is required in the next step.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(
                    0xFF999999,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 255, 27, 11),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Submit",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerFormField extends StatelessWidget {
  final String title;
  final String hint;
  const CustomerFormField({super.key, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 2.0, 0.0, 10.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                ),
                contentPadding: const EdgeInsets.only(left: 10),
                hintText: hint,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(
                    0xFF999999,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
