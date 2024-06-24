// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
//
// import '../../../../../core/utils/constant.dart';
// import '../../manage/cubit/setting_cubit.dart';
// import '../../manage/cubit/setting_states.dart';
//
// class AboutUsViewBody extends StatelessWidget {
//   const AboutUsViewBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SettingCubit, SettingStates>(
//       listener: (BuildContext context, state) {},
//       builder: (BuildContext context, Object? state) {
//         var cubit = context.read<SettingCubit>();
//         return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   'assets/images/unnamed 1.png',
//                   width: 250,
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'This App specializes in emotion analysis technology, utilizing text, video, and voice to accurately interpret human emotions. Our innovative application integrates machine learning, natural language processing, facial recognition, and voice analysis to deliver real-time insights across various interactions.',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//             //    const Spacer(),
//                 const Text(
//                   'Contact Us',
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 InkWell(
//                   onTap: () => _launchLinkedInURL(),
//                   child: CircleAvatar(
//                     backgroundImage: NetworkImage(
//                       cubit.contactUsModel?.data?.data?.isNotEmpty ?? false
//                           ? cubit.contactUsModel!.data!.data![0].image!
//                           : 'https://via.placeholder.com/150',
//                     ),
//                     radius: 30,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 if (cubit.contactUsModel?.data?.data?.isNotEmpty ?? false)
//                   SizedBox(
//                     height: 50,
//                     child: ListView.separated(
//                       physics: const BouncingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         var contact = cubit.contactUsModel!.data!.data![index];
//                         return InkWell(
//                           onTap: () => _launchLinkedInURL(),
//                           child: CircleAvatar(
//                             backgroundImage: NetworkImage(contact.image ?? ''),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                       },
//                       separatorBuilder: (context, index) =>
//                       const SizedBox(width: 10),
//                       itemCount: cubit.contactUsModel!.data!.data!.length,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // Function to launch LinkedIn URL
//   void _launchLinkedInURL() async {
//     const url = 'https://www.linkedin.com/in/moaz-mohamed-46b053231/';
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(
//         Uri.parse(url),
//         mode: LaunchMode.externalApplication, // This specifies opening in a browser
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class AboutUsViewBody extends StatelessWidget {
 // final List<Contact> contacts;

  const AboutUsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.jpg',
            width: 250,
          ),
          const SizedBox(height: 10),
          const Text(
            'This App specializes in emotion analysis technology, utilizing text, video, and voice to accurately interpret human emotions. Our innovative application integrates machine learning, natural language processing, facial recognition, and voice analysis to deliver real-time insights across various interactions.',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var contact = contacts[index];
                return InkWell(
                  onTap: () => _launchLinkedInURL(contact.linkedInUrl),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(contact.imageUrl),
                    backgroundColor: Colors.transparent,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: contacts.length,
            ),
          ),
        ],
      ),
    );
  }

  // Function to launch LinkedIn URL
  void _launchLinkedInURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication, // This specifies opening in a browser
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

// Model for Contact
class Contact {
  final String name;
  final String imageUrl;
  final String linkedInUrl;

  Contact({
    required this.name,
    required this.imageUrl,
    required this.linkedInUrl,
  });
}

// Define a list of contacts
List<Contact> contacts = [
  Contact(
    name: 'Moaz Mohamed',
    imageUrl: 'assets/images/moaz.jpg',
    linkedInUrl: 'https://www.linkedin.com/in/moaz-mohamed-46b053231/',
  ),
  Contact(
    name: 'Mostafa Mohamed',
    imageUrl: 'assets/images/mostafa.jpg',
    linkedInUrl: 'https://www.linkedin.com/in/mostafa-mohamed-talkhan-58a7b927a/',
  ),
  Contact(
    name: 'Emad Ahmed',
    imageUrl: 'assets/images/emad.jpg',
    linkedInUrl: 'https://www.linkedin.com/in/emad-ahmed-196712284?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
  ),
  // Add more contacts as needed
];
