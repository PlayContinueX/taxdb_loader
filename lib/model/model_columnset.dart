import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPageContainerColumnSet extends StatelessWidget {
  const MainPageContainerColumnSet({
    super.key,
    required this.l_bordersideAll,
    required this.r_bordersideAll,
    required this.width,
    required this.height,
    required this.contentName,
    this.contentWidget,
  });

  final List<bool> l_bordersideAll;
  final List<bool> r_bordersideAll;
  final double width;
  final List<double> height;
  final String contentName;
  final Widget? contentWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * width,
          height: MediaQuery.of(context).size.height * height[0],
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
          width: MediaQuery.of(context).size.width * width,
          height: MediaQuery.of(context).size.height * height[1],
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
          child: contentWidget,
        )
      ],
    );
  }
}
