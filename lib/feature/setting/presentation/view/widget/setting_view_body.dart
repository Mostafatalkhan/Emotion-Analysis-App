import 'package:flutter/material.dart';
import 'package:graduationproject/feature/setting/presentation/view/widget/contact_us.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/shared_preference.dart';
import '../../../../login/presentation/view/login_view.dart';
import '../about_us_view.dart';
import '../change_password_view.dart';
import '../complaints_view.dart';
import 'account.dart';
import 'setting_item.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              const Account(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 40,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black12,
                ),
              ),
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SettingItem(
                function: () {
                  navigateTo(context, const ChangePasswordView());
                },
                text: 'Change Password',
                icon: Icons.password,
              ),
              SettingItem(
                function: () {
                  navigateTo(context, const ComplaintsView());
                },
                text: 'Add Complaints',
                icon: Icons.message,
              ),
              SettingItem(
                function: () {
                  navigateTo(context, const AboutUsView());
                },
                text: 'About Us',
                icon: Icons.roundabout_left,
              ),
              SettingItem(
                function: () {
                  navigateTo(context, const ContactUsView());
                },
                text: 'Contact Us',
                icon: Icons.contact_page_outlined,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: InkWell(
                  onTap: () {
                    SharedPreference.removeData(key: 'token').then((value) => {
                          if (value)
                            navigateAndFinish(context, const LoginView()),
                        });
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
