import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/colors.dart';
import 'package:moniepoint_test/utils/dimension.dart';

class IconWithBadge extends StatelessWidget {
  final IconData iconName;

  final String notificationCount;

  const IconWithBadge({
    super.key,
    required this.iconName,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          iconName,
          size: getProportionateMobileHeight(25),
          color: primaryColor,
        ),
        Positioned(
          top: getProportionateMobileHeight(0),
          right: getProportionateMobileHeight(-6),
          child: Container(
            height: getProportionateMobileHeight(15),
            width: getProportionateMobileHeight(18),
            decoration: BoxDecoration(
              color: notificationbadgeColor,
              borderRadius:
                  BorderRadius.circular(getProportionateMobileHeight(2)),
            ),
            child: Center(
              child: Text(
                notificationCount,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateMobileHeight(10),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
