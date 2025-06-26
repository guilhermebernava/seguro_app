import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/core/widgets/custom_button.dart';
import 'package:seguro_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:seguro_app/app/modules/auth/widgets/toggle_widget/custom_toggle_button.dart';

class ToggleWidgetWeb extends StatefulWidget {
  final EdgeInsets padding;
  final Widget SignIn;
  final Widget SignUp;
  final AuthController authController;

  const ToggleWidgetWeb({
    super.key,
    this.padding = const EdgeInsets.all(0),
    required this.SignIn,
    required this.SignUp,
    required this.authController,
  });

  @override
  State<ToggleWidgetWeb> createState() => _ToggleWidgetWebState();
}

class _ToggleWidgetWebState extends State<ToggleWidgetWeb> {
  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final containerWidth = screenWidth > 1000 ? screenWidth * 0.3 : screenWidth;

    return Padding(
      padding: widget.padding,
      child: Center(
        child: Container(
          height: 375,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: containerWidth,
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    spacing: 20,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomToggleButton(
                            text: 'Entrar',
                            isSelected: showFirst,
                            onPressed: () {
                              widget.authController.reset();
                              setState(() {
                                showFirst = true;
                              });
                            },
                          ),

                          CustomToggleButton(
                            text: 'Cadastrar',
                            isSelected: !showFirst,
                            onPressed: () {
                              widget.authController.reset();
                              setState(() {
                                showFirst = false;
                              });
                            },
                          ),
                        ],
                      ),

                      showFirst ? widget.SignIn : widget.SignUp,
                    ],
                  ),
                ),
              ),
              showFirst
                  ? Positioned(
                      bottom: 0,
                      child: CustomButton(
                        size: 75,
                        onPressed: () async {
                          await widget.authController.signIn(context, false);
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
