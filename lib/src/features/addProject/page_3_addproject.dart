import 'package:essay_projects/src/config/common_widgets/app_textfild.dart';
import 'package:essay_projects/src/config/common_widgets/space_box.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class PageThirdAddProject extends StatefulWidget {
  const PageThirdAddProject({super.key});

  @override
  State<PageThirdAddProject> createState() => _PageThirdAddProjectState();
}

class _PageThirdAddProjectState extends State<PageThirdAddProject> {
  String? selectedValue;
  String convertedTextOfFrom = "";
  String convertedTextOfTo = "";
  TextEditingController toAmountController = TextEditingController();
  TextEditingController fromAmountController = TextEditingController();

  String numberToWords(int number) {
    const numbersLessThan20 = [
      "",
      "One",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Eleven",
      "Twelve",
      "Thirteen",
      "Fourteen",
      "Fifteen",
      "Sixteen",
      "Seventeen",
      "Eighteen",
      "Nineteen",
    ];
    const tens = [
      "",
      "",
      "Twenty",
      "Thirty",
      "Forty",
      "Fifty",
      "Sixty",
      "Seventy",
      "Eighty",
      "Ninety",
    ];
    try {
      if (number == 0) {
        return "Zero";
      }

      if (number < 0) {
        return "Negative ${numberToWords(number.abs())}";
      }

      var word = "";

      if (number < 100) {
        if (number < 20) {
          word = numbersLessThan20[number];
        } else {
          word = tens[number ~/ 10] +
              (number % 10 != 0 ? " ${numbersLessThan20[number % 10]}" : "");
        }
      } else {
        word =
            "${numberToWords(number ~/ 100)} Hundred${number % 100 != 0 ? " ${numberToWords(number % 100)}" : ""}";
      }

      return word.trim();
    } catch (e, s) {
      print(e);
      print(s);
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Project basis",
                style: AppTextStyle.poppinsMediumText(fontSize: 18),
              ),
            ),
            15.kH,
            Column(
              children: [
                Row(
                  children: [
                    const Expanded(child: Text("From")),
                    10.kW,
                    // SizedBox(
                    //   width: 10,
                    // ),
                    const Expanded(child: Text("To")),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: AppTextField(
                        controller: fromAmountController,
                        hintText: "100000",
                        onChange: (value) {
                          convertedTextOfFrom = numberToWords(
                              int.parse(fromAmountController.text.trim()));
                          setState(() {});
                          print(fromAmountController.text.isEmpty);
                        },
                        prefixIcon: const SizedBox(
                          child: Icon(Icons.attach_money_outlined),
                        ),
                      ),
                    ),
                   10.kW,
                    Flexible(
                      child: Flexible(
                        child: AppTextField(
                          controller: toAmountController,
                          hintText: "150000",
                          prefixIcon: const SizedBox(
                            child: Icon(Icons.attach_money_outlined),
                          ),
                          onChange: (value) {
                            convertedTextOfTo = numberToWords(
                                int.parse(toAmountController.text.trim()));
                            setState(() {});
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            25.kH,
            // const SizedBox(
            //   height: 25,
            // ),
            Column(
              children: [
                ClipPath(
                  clipper: MovieTicketBothSidesClipper(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 10),
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 1),
                      ),
                    ], color: Colors.white),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Selected Currency",
                              style: AppTextStyle.poppinsSemiBoldText(
                                  fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              "Dollar (\u0024)",
                              style: AppTextStyle.poppinsMediumText(
                                  color: Colors.green),
                            )
                          ],
                        ),
                        10.kH,
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        (fromAmountController.text.isEmpty ||
                                toAmountController.text.isEmpty)
                            ? const Text("N/A")
                            : Text(
                                "Your Range Is From ${fromAmountController.text.toString()} to ${toAmountController.text.toString()} "),
                      10.kH,
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(width: .5),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  "Amount in Word",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.poppinsSemiBoldText(
                                      fontSize: 16),
                                ),
                              ),
                              5.kH,
                              // const SizedBox(
                              //   height: 5,
                              // ),

                              (convertedTextOfFrom.isEmpty ||
                                      convertedTextOfTo.isEmpty)
                                  ? const Text("N/A")
                                  : RichText(
                                      text: TextSpan(
                                        style: AppTextStyle.poppinsMediumText(
                                            color: Colors.black),
                                        children: [
                                          const TextSpan(
                                            text: 'Your Range Is From ',
                                          ),
                                          TextSpan(
                                            text: "'$convertedTextOfFrom'",
                                            style:
                                                AppTextStyle.poppinsBoldText(),
                                          ),
                                          const TextSpan(
                                            text: " to ",
                                          ),
                                          TextSpan(
                                            text: "'$convertedTextOfTo'",
                                            style:
                                                AppTextStyle.poppinsBoldText(),
                                          ),
                                        ],
                                      ),
                                    )

                              //  Text(
                              //     "Your Range Is From $convertedTextOfFrom to $convertedTextOfTo ")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
