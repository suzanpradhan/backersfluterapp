import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/enums/auth_text_types.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final AuthTextTypes authTextTypes;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final Function(String)? onChanged;
  final String? errorMessage;
  const AuthTextField(
      {Key? key,
      required this.hintText,
      required this.authTextTypes,
      required this.focusNode,
      this.errorMessage,
      this.onChanged,
      required this.textEditingController})
      : super(key: key);

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isHintVisible = true;
  bool isTextFieldVisible = false;
  bool isVisbleText = true;

  changeFocus({required BuildContext context, required FocusNode focusNode}) {
    FocusScope.of(context).requestFocus(widget.focusNode);
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (!widget.focusNode.hasFocus &&
          widget.textEditingController.text == "") {
        setState(() {
          isHintVisible = true;
          isTextFieldVisible = false;
        });
      }
    });

    if (widget.authTextTypes == AuthTextTypes.password) {
      isVisbleText = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 52,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: CustomColors.darkBlueFade,
              border: Border.all(width: 1, color: CustomColors.darkBlueShade)),
          child: Stack(
            children: [
              Visibility(
                maintainState: true,
                visible: isTextFieldVisible,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Text(
                        widget.hintText.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: "FFMarkBlack",
                            color: CustomColors.darkBlueShade),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, bottom: 5, right: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: widget.textEditingController,
                              focusNode: widget.focusNode,
                              cursorColor: CustomColors.greenAccent,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              obscureText: !isVisbleText,
                              onChanged: widget.onChanged,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "FFMarkRegular",
                                  color: CustomColors.white),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  isCollapsed: true),
                            ),
                          ),
                          (widget.authTextTypes == AuthTextTypes.password)
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisbleText = !isVisbleText;
                                    });
                                  },
                                  child: Icon(
                                    isVisbleText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: CustomColors.darkBlueShade,
                                    size: 20,
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                  maintainState: true,
                  visible: isHintVisible,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: CustomColors.darkBlueShade,
                    onTap: () {
                      setState(() {
                        isHintVisible = !isHintVisible;
                        isTextFieldVisible = !isTextFieldVisible;
                      });
                      changeFocus(
                          context: context, focusNode: widget.focusNode);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.hintText.toUpperCase(),
                          style: const TextStyle(
                              fontFamily: "FFMarkRegular",
                              color: CustomColors.darkBlueShade,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        (widget.errorMessage != null)
            ? Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColors.redBlueBlack,
                      border:
                          Border.all(width: 0.5, color: CustomColors.redDark)),
                  child: Text(
                    widget.errorMessage!,
                    style: const TextStyle(
                        fontFamily: "FFMarkRegular",
                        fontSize: 12,
                        color: CustomColors.red),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
