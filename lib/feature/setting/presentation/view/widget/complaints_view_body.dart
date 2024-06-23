import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/constant.dart';
import '../../manage/Complaints Cubit/complaints_cubit.dart';
import '../../manage/Complaints Cubit/complaints_states.dart';

class ComplaintsViewBody extends StatelessWidget {
  ComplaintsViewBody({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComplaintsCubit, ComplaintsStates>(
      listener: (BuildContext context, state) {
        if (state is ComplaintsSuccessStates) {
          if (state.addComplaintsModel.status!) {
            showToast(
              text: state.addComplaintsModel.message!,
              color: Colors.green,
            );
          }
          else{
            showToast(
              text: state.addComplaintsModel.message!,
              color: Colors.red,
            );
          }
        }
      },
      builder: (BuildContext context, Object? state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                // const SizedBox(
                //   height: 20,
                // ),
                // const Image(image: AssetImage('assets/images/Group 6.png')),
                const SizedBox(
                  height: 20,
                ),
                textFormField(
                  text: 'Name',
                  type: TextInputType.name,
                  controller: nameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                textFormField(
                  text: 'Email',
                  type: TextInputType.emailAddress,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                textFormField(
                  text: 'Phone',
                  type: TextInputType.phone,
                  controller: phoneController,
                ),
                const SizedBox(
                  height: 20,
                ),
                textFormField(
                  text: 'Message',
                  type: TextInputType.text,
                  controller: messageController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(
                  condition: state is! ComplaintsLoadingStates,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(
                      //horizontal: 20,
                      vertical: 10,
                    ),
                    child: buildMaterialButton(
                      function: () {
                        ComplaintsCubit.get(context).addComplaints(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          message: messageController.text,
                        );
                      },
                      width: 300,
                      text: 'Add Complaints',
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blueGrey,
                    ),
                  ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
