import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/works.dart';
import 'separatorline.dart';

class ListOfWorksDesktop extends StatelessWidget {
  const ListOfWorksDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.maxFinite,
          height: 30,
        ),
        for (int i = 0; i < workTypes.length; i++) //pętla rodzajów
          Column(
            children: [
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              //color: Colors.green,
                              //width: constraints.maxWidth/2,
                              child: Text(
                                workTypes[i],
                                style: const TextStyle(fontSize: 24),
                              ),
                            )
                          ]),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            for (int ii = 0; ii < worksList.length; ii++)
                              if (worksList[ii][3] == i)
                                Container(
                                  //width: constraints.maxWidth/2,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 40),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: worksList[ii].length >=
                                                          5
                                                      ? InkWell(
                                                            onTap: () async {
                                                            final Uri url = Uri.parse(worksList[ii][4] as String);
                                                            if (await canLaunchUrl(url)) {
                                                              await launchUrl(url);
                                                            }
                                                            },
                                                          child: Text(
                                                            '${worksList[ii][0]} for ${worksList[ii][1]}',
                                                            maxLines: 4,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                          ))
                                                      : Text(
                                                          '${worksList[ii][0]} for ${worksList[ii][1]}',
                                                          maxLines: 4,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18),
                                                        )),
                                              // ignore: unnecessary_null_comparison
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Text(
                                                    worksList[ii][2] == 0
                                                        ? "Empty"
                                                        : '${worksList[ii][2]}',
                                                    style: const TextStyle(
                                                        fontSize: 18),
                                                  )) //rok
                                            ]),
                                      ),
                                      const Divider(
                                        color: CustomColor.whitePrimary,
                                        height: 0,
                                      )
                                    ],
                                  ),
                                )
                          ]),
                    ),
                  ]),
              if (i < workTypes.length - 1) const Padding(
                padding: EdgeInsets.only(top: 30),
                child: SeparatorLine(),
              )
            ],
          ),
      ],
    );
  }
}