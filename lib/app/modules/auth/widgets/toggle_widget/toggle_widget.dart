import 'package:flutter/material.dart';
import 'package:seguro_app/app/core/theme/app_colors.dart';
import 'package:seguro_app/app/core/widgets/custom_button.dart';
import 'package:seguro_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:seguro_app/app/modules/auth/widgets/toggle_widget/custom_toggle_button.dart';

class ToggleWidget extends StatefulWidget {
  final EdgeInsets padding;
  final Widget SignIn;
  final Widget SignUp;
  final AuthController authController;

  const ToggleWidget({
    super.key,
    this.padding = const EdgeInsets.all(0),
    required this.SignIn,
    required this.SignUp,
    required this.authController,
  });

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    return Padding(
      padding: widget.padding,
      child: Center(
        child: Container(
          height: 410,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: screenWidth,
                height: 340,
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
