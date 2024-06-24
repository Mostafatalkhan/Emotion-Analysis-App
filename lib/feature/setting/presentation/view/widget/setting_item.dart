import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({Key? key, required this.text, required this.icon, this.function}) : super(key: key);

   final String text;
   final IconData icon;
  final Function()? function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
      ),
      child: InkWell(
        onTap: function,
        child: Row(
          children: [
             CircleAvatar(
              child: Icon(icon),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style:const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Spacer(),
             const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
