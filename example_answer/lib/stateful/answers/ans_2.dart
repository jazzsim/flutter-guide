import 'package:flutter/material.dart';

class Ans2 extends StatefulWidget {
  const Ans2({super.key});

  static route(BuildContext context) => MaterialPageRoute(builder: (context) => const Ans2());

  @override
  State<Ans2> createState() => _Ans2State();
}

class _Ans2State extends State<Ans2> {
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController motherMaidensNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();

  bool agree = false;

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
        body: Form(
          onChanged: () => setState(() {}),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerFormField(
                  title: "Contact Number*",
                  hint: "Please enter contact number",
                  controller: contactNumberController,
                ),
                CustomerFormField(
                  title: "Mother Maiden's Name",
                  hint: "Please enter mother maiden's name",
                  controller: motherMaidensNameController,
                ),
                CustomerFormField(
                  title: "Email Address*",
                  hint: "Please enter email address",
                  controller: emailAddressController,
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
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Marketing Consent",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "By proceeding, I consent to and authorie redONE to use and process my particulars (\"Perosnal Data\") for the purpose of sales and marketing of products, services and promotions.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    agree = !agree;
                    setState(() {});
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: agree,
                        checkColor: Colors.white,
                        fillColor: agree ? const WidgetStatePropertyAll(Colors.red) : null,
                        onChanged: (value) {
                          agree = value ?? false;
                          setState(() {});
                        },
                      ),
                      const Flexible(
                        child: Text(
                          "Please untick if you don't want to receive marketing and promotional messages from redONE or other related parties.",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
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
                          onPressed: allowSubmit() ? () {} : null,
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            backgroundColor: allowSubmit()
                                ? const WidgetStatePropertyAll(
                                    Color.fromARGB(255, 255, 27, 11),
                                  )
                                : null,
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
        ),
      ),
    );
  }

  bool allowSubmit() {
    return contactNumberController.text.isNotEmpty &&
        motherMaidensNameController.text.isNotEmpty &&
        emailAddressController.text.isNotEmpty &&
        agree;
  }
}

class CustomerFormField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  const CustomerFormField({super.key, required this.title, required this.hint, required this.controller});

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
                fontSize: 16,
              ),
            ),
          ),
          TextFormField(
            controller: controller,
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
