import 'package:flutter/material.dart';

class ThirdNewWidget extends StatelessWidget {
  String thirdName ;
  String thirdPhone;
  void Function() onClick;

  ThirdNewWidget({
    required this.thirdName,
    required this.thirdPhone,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: $thirdName',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Phone: $thirdPhone',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                onClick();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
