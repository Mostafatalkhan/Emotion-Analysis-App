import 'package:flutter/material.dart';
import 'package:graduationproject/feature/setting/presentation/view/widget/text_account.dart';


class AccountImageAndTextSection extends StatelessWidget {
  const AccountImageAndTextSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 50,
        bottom: 30,
      ),
      child: Center(
        child: Column(
          children:  [
            // CircleAvatar(
            //   radius: 52,
            //   backgroundColor: Colors.white,
            //   child: CircleAvatar(
            //     radius: 50,
            //     backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            //if(SettingCubit().get(context).profileModel !=null)
            TextAccount(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mobile Developer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
