import 'package:cat_task/constant/styles.dart';
import 'package:flutter/material.dart';
class AppItem extends StatelessWidget {
  const AppItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: sizeFromWidth(context, 2.5),
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade400)),
            child: TextButton.icon(
                onPressed: () {},
                icon: const ImageIcon(
                    AssetImage('assets/facebook1.png')),
                label: const Text(
                  'Facebook',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ))),
        InkWell(
          onTap: () {},
          child: Container(
              width: sizeFromWidth(context, 2.5),
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey.shade400)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/google1.png'),
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Google',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
