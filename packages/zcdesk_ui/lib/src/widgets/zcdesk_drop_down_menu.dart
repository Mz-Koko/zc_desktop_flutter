import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

class ZcdeskReusableDropDownMenu extends StatelessWidget {
  /// bool to check if drop down menu is open or closed
  final bool? isDropDownOpen;

  /// Function called when drop down tapped
  final void Function()? onDropDownTapped;

  /// Function called when trailing icon tapped
  final void Function()? onTrailingIconTapped;

  /// Drop Down Main Title
  final String? dropDownMainTitle;

  final Widget? child;

  const ZcdeskReusableDropDownMenu({
    Key? key,
    this.isDropDownOpen,
    this.onDropDownTapped,
    this.onTrailingIconTapped,
    this.dropDownMainTitle,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: onDropDownTapped,
                      child: isDropDownOpen!
                          ? SvgPicture.asset(SVGAssetPaths.dropDownOpenIcon)
                          : SvgPicture.asset(SVGAssetPaths.dropDownOpenIcon),
                    ),
                    horizontalSpaceSmall,
                    Container(
                      child: ZcdeskText.leftSideBarText(dropDownMainTitle!),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTrailingIconTapped,
                child: SvgPicture.asset("assets/icons/add_drop_down.svg"),
              ),
            ],
          ),
          verticalSpaceSmall,
          child!,
        ],
      ),
    );
  }
}
