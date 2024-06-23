import 'package:flutter/material.dart';

import 'widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp,color: Colors.black,size: 30,),
        ),
      ),
      body: const RegisterViewBody(),
    );
  }
}
