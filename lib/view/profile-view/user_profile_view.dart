import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constant-widgets/constant_textfield.dart';
import 'package:crime_management_system/constants/colors.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:crime_management_system/model/profile_model.dart';
import 'package:crime_management_system/view-model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: const ConstantAppBar(text: 'ProfileView'),
          body: StreamBuilder<ProfileModel>(
              stream: profileViewModel.getUserData(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: SpinKitCircle(
                    color: kBlack,
                  ));
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return Center(
                      child: Text('No user data', style: kHead2Black));
                } else {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.02,
                          vertical: Get.height * 0.02),
                      child: Consumer<ProfileViewModel>(
                          builder: (context, value, child) {
                        return Column(
                          children: [
                            Center(
                                child: Stack(
                              children: [
                                profileViewModel.image != null
                                    ? CircleAvatar(
                                        radius: 35.r,
                                        backgroundImage:
                                            FileImage(profileViewModel.image!))
                                    : CircleAvatar(
                                        radius: 35.r,
                                        backgroundImage: NetworkImage(snapshot
                                                .data?.profileImage ??
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnme6H9VJy3qLGvuHRIX8IK4jRpjo_xUWlTw&usqp=CAU')),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                        onTap: () =>
                                            profileViewModel.pickImage(),
                                        child: value.isUpload
                                            ? SpinKitCircle(
                                                size: 24.r,
                                                color: kBlack,
                                              )
                                            : Icon(Icons.camera_alt)))
                              ],
                            )),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            ListTile(
                              tileColor: constantColor,
                              title: Text(
                                'Name',
                                style: kBody1Black,
                              ),
                              subtitle: Text(
                                value.name,
                                style: kBody2Black,
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    openDialog(context, nameController, 'Name',
                                        Icons.person, profileViewModel);
                                  },
                                  icon: const Icon(Icons.edit)),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            ListTile(
                              tileColor: constantColor,
                              title: Text(
                                'Email',
                                style: kBody1Black,
                              ),
                              subtitle: Text(
                                snapshot.data!.email,
                                style: kBody2Black,
                              ),
                            ),
                          ],
                        );
                      }));
                }
              }))),
    );
  }
}

Future openDialog(context, TextEditingController controller, String hintText,
    IconData icon, ProfileViewModel profileViewModel) async {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            'Update',
            style: kBody1Black,
          ),
          actions: [
            ConstantTextField(
                controller: controller, hintText: hintText, prefixIcon: icon),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Cancel',
                      style: kBody2Black,
                    )),
                TextButton(
                    onPressed: () =>
                        profileViewModel.updateName(controller.text.trim()),
                    child: Text(
                      'Update',
                      style: kBody2Black,
                    ))
              ],
            )
          ],
        );
      });
}
