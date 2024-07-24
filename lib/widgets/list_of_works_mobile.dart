import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import '../constants/colors.dart';
import '../constants/works.dart';
import 'separatorline.dart';

class ListOfWorksMobile extends StatelessWidget {
  const ListOfWorksMobile({super.key});

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
              Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                                                          onTap: () {
                                                            js.context
                                                                .callMethod(
                                                                    'open', [
                                                              worksList[ii][4]
                                                            ]);
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
              if (i < workTypes.length - 1)
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SeparatorLine(),
                )
            ],
          ),
      ],
    );
  }
}
