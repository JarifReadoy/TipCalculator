import 'package:flutter/material.dart';
import 'package:tipcalculator/simpleinputfilled.dart';

class tipcalculator extends StatefulWidget {
  const tipcalculator({super.key});

  @override
  State<tipcalculator> createState() => _tipcalculatorState();
}

class _tipcalculatorState extends State<tipcalculator> {
  final formKey = GlobalKey<FormState>();

  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerColor = Color(0xffF5F8FB);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tip Calculator",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// top section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      "Total Bill",
                      style: TextStyle(color: textLightBlack),
                    ),
                    Text(
                      "\$ ${totalBillController.text}",
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: textBlack),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Person",
                          style: TextStyle(color: textLightBlack),
                        ),
                        Text(
                          "Tip Amount",
                          style: TextStyle(color: textLightBlack),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "05",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: textBlack),
                        ),
                        Text(
                          "\$ 20.0",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: textBlack),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///gap
              const SizedBox(
                height: 10,
              ),

              ///per person section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount Per person",
                      style: TextStyle(color: textLightBlack),
                    ),
                    Text(
                      "\$ 20.0",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: textBlack),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              simpleinputfilled(
                  controller: totalBillController,
                  title: "Total Bill",
                  iconData: Icons.attach_money,
                  hintText: "Please enter total bill"),
              simpleinputfilled(
                  controller: totalTipController,
                  title: "Tip Percentage",
                  iconData: Icons.percent,
                  hintText: "Please enter tip percentage"),
              simpleinputfilled(
                  controller: totalPeopleController,
                  title: "Number of people",
                  hintText: "Please enter total number"),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        formKey.currentState!.validate();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 45),
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: const Text(
                          "calculate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 45),
                      decoration: BoxDecoration(
                          color: clearButtonColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "Clear",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
