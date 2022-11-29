import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPageContainerRowSet extends StatelessWidget {
  const MainPageContainerRowSet({
    super.key,
    required this.l_bordersideAll,
    required this.r_bordersideAll,
    required this.width,
    required this.height,
    required this.contentName,
    required this.contentValue,
    this.isPhoneNumber = false,
  });

  final List<bool> l_bordersideAll;
  final List<bool> r_bordersideAll;
  final List<double> width;
  final double height;
  final String contentName;
  final dynamic contentValue;
  final bool? isPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * width[0],
          height: MediaQuery.of(context).size.height * height,
          decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
              border: Border(
                left: BorderSide(
                    width: l_bordersideAll[0] ? 1 : 0,
                    color: Theme.of(context).primaryColor),
                right: BorderSide(
                    width: l_bordersideAll[1] ? 1 : 0,
                    color: Theme.of(context).primaryColor),
                top: BorderSide(
                    width: l_bordersideAll[2] ? 1 : 0,
                    color: Theme.of(context).primaryColor),
                bottom: BorderSide(
                    width: l_bordersideAll[3] ? 1 : 0,
                    color: Theme.of(context).primaryColor),
              )),
          child: Center(
              child: AutoSizeText(
            contentName,
            textAlign: TextAlign.center,
          )),
        ),
        Container(
          width: MediaQuery.of(context).size.width * width[1],
          height: MediaQuery.of(context).size.height * height,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                  width: r_bordersideAll[0] ? 1 : 0,
                  color: Theme.of(context).primaryColor),
              right: BorderSide(
                  width: r_bordersideAll[1] ? 1 : 0,
                  color: Theme.of(context).primaryColor),
              top: BorderSide(
                  width: r_bordersideAll[2] ? 1 : 0,
                  color: Theme.of(context).primaryColor),
              bottom: BorderSide(
                  width: r_bordersideAll[3] ? 1 : 0,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          child: Center(
            child: isPhoneNumber == true
                ? TextButton(
                    onPressed: () {
                      _makePhoneCall(contentValue);
                    },
                    child: Text(contentValue))
                : AutoSizeText(
                    contentValue,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                  ),
          ),
        )
      ],
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
