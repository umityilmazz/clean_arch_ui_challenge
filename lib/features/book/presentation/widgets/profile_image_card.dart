import 'package:flutter/material.dart';

import '../../../../core/constants/asset_constants.dart';

class ProfileImageCard extends StatelessWidget {
  const ProfileImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetConstants.instance.profileImage)),
        border: Border.all(color: Colors.black, width: 1),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 5),
          ),
        ],
      ),
    );
  }
}
