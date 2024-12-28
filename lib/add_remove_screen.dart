import 'package:add_delete/new_widget.dart';
import 'package:add_delete/second_new_widget.dart';
import 'package:add_delete/third%20_new_widget.dart';
import 'package:flutter/material.dart';

class AddRemoveScreen extends StatefulWidget {
  const AddRemoveScreen({super.key});

  @override
  AddRemoveScreenState createState() => AddRemoveScreenState();
}

class AddRemoveScreenState extends State<AddRemoveScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> textForm = GlobalKey<FormState>();

  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;

  String firstName = '';
  String firstPhone = '';
  String secondName = '';
  String secondPhone = '';
  String thirdName = '';
  String thirdPhone = '';

  void firstButton() {
    setState(() {
      if (visible1 == true) {
        visible1 = false;
      }
    });
  }

  void secondButton() {
    setState(() {
      if (visible2 == true) {
        visible2 = false;
      }
    });
  }

  void thirdButton() {
    setState(() {
      if (visible3 == true) {
        visible3 = false;
      }
    });
  }

  void addButton() {
    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
      setState(() {
        if (visible1 == false) {
          visible1 = true;
          firstName = nameController.text;
          firstPhone = phoneController.text;
        } else if (visible2 == false) {
          visible2 = true;
          secondName = nameController.text;
          secondPhone = phoneController.text;
        } else {
          visible3 = true;
          thirdName = nameController.text;
          thirdPhone = phoneController.text;
        }
      });
    } else {
      textForm.currentState!.validate();
    }

    nameController.clear();
    phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff9E9E9E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        title: const Center(
          child: Text(
            "Contact Screen",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.20),

        //Start form

        child: Form(
          key: textForm,
          child: Column(children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'name can not be empty';
                }
              },
              controller: nameController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Color(0xFF2196F3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFF2196F3),
                    width: 3,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: "Enter Your Name",
              ),
            ),

            //Name TextField
            SizedBox(height: height * 0.03),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (value){
                if (value!.isEmpty) {
                  return 'phone can not be empty';
                }
              },
              controller: phoneController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Color(0xFF2196F3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFF2196F3),
                    width: 3,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: "Enter Your Phone Number",
              ),
            ),

            //phone TextField
            SizedBox(height: height * 0.02),
            //TextField
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                    onPressed: () {
                      addButton();
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Button Widget
            SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                    visible: visible1,
                    child: FirstNewWidget(
                        firstName: firstName,
                        firstPhone: firstPhone,
                        onClick: firstButton),
                  ),
                  Visibility(
                      visible: visible2,
                      child: SecondNewWidget(
                          secondName: secondName,
                          secondPhone: secondPhone,
                          onClick: secondButton)),
                  Visibility(
                      visible: visible3,
                      child: ThirdNewWidget(
                          thirdName: thirdName,
                          thirdPhone: thirdPhone,
                          onClick: thirdButton))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
