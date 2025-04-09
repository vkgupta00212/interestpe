import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../model/data.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/setting_tile.dart';
import '../../widgets/section_card.dart';
import '../../widgets/profile/select_image_bottom_sheet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const id = '/profilePage';

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, value, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  children: [
                    const CustomBackButton(title: 'Profile'),
                    Hero(
                      tag: 'profile',
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomRight,
                        children: [
                          const CircleAvatar(
                            radius: 45.0,
                            backgroundImage:
                            AssetImage('assets/img/user.jpeg'),
                          ),
                          Positioned(
                            right: -3,
                            child: GestureDetector(
                              onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                const SelectImageBottomSheet(),
                              ),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: kPrimaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SectionCard(
                      children: [
                        const CustomTextField(
                          hintText: 'Contact Person Name',
                          prefixIcon: Icons.person,
                          label: 'Contact Person Name*',
                          textInputType: TextInputType.name,
                          maxLength: 20,
                        ),
                        const CustomTextField(
                          hintText: 'Mobile Number',
                          prefixIcon: Icons.phone_android,
                          label: 'Mobile Number*',
                          textInputType: TextInputType.name,
                          maxLength: 20,
                        ),
                        const CustomTextField(
                          hintText: 'Email ID',
                          prefixIcon: Icons.email,
                          label: 'Email ID*',
                          textInputType: TextInputType.emailAddress,
                          maxLength: 20,
                        ),

                    //     SettingTile(
                    //       onTap: () =>
                    //           {},
                    //       icon: Icons.apartment,
                    //       title: 'Business Type',
                    //       // subTitle: value.selectedBusinessType,
                    //       trailing: const Icon(Icons.chevron_right),
                    //     ),
                    //     SettingTile(
                    //       onTap: () => {},
                    //       icon: Icons.category,
                    //       title: 'Business Category',
                    //       // subTitle: value.selectedBusinessCategory,
                    //       trailing: const Icon(Icons.chevron_right),
                    //     ),
                    //   ],
                    // ),
                    CustomButton(
                      onTap: () {},
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10.0),
                      title: 'Save Changes',
                    ),
                  ],
                ),
                ],
              ),
            ),
          ),
          ),
        );
      },
    );
  }
}
