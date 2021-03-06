import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../IndividualTrack.dart';

class track_vehicle extends StatefulWidget {
  Size size;
  Map<String, String> info;
  track_vehicle(this.size, this.info, {Key? key}) : super(key: key);

  @override
  State<track_vehicle> createState() => _track_vehicleState();
}

class _track_vehicleState extends State<track_vehicle> {
  //
  bool isCompleted = true;

  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreenWithRouteSettings(
          context,
          screen: IndividualTrackPage(),
          settings: RouteSettings(
            name: IndividualTrackPage.routeName,
            arguments: widget.info,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(4),
        height: widget.size.height * 0.26,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.25)),
        child: Column(
          children: [
            Container(
              height: (widget.size.height * 0.26) * 0.12,
              padding: const EdgeInsets.only(
                top: 5,
                left: 5,
                right: 5,
                bottom: 5,
              ),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SR. No",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    "Name",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    "Mobile Number",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    "Address",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: (widget.size.height * 0.26) * 0.02,
            ),
            DottedBorder(
              color: Colors.black87,
              strokeWidth: 0.2,
              child: Container(
                height: (widget.size.height * 0.26) * 0.12,
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                  right: 5,
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.info['serialno']!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      widget.info['name']!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      widget.info['number']!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      widget.info['address']!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: (widget.size.height * 0.26) * 0.01,
            ),
            Row(
              children: [
                DottedBorder(
                  color: Colors.black12,
                  strokeWidth: 0.8,
                  child: Container(
                    padding: const EdgeInsets.all(2.5),
                    height: (widget.size.height * 0.26) * 0.3,
                    width: 90,
                    // color: Colors.black12,
                    child: Column(
                      children: [
                        Text(
                          'Vehicle',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.black,
                                fontSize: 9.8,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          height: (widget.size.height * 0.26) * 0.01,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: (widget.size.height * 0.26) * 0.15,
                              width: 45,
                              child: Image.network(widget.info["vehicalImage"]!,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(
                              width: (widget.size.height * 0.26) * 0.01,
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.info["vehicle"]!,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        overflow: TextOverflow.clip,
                                        color: Colors.black,
                                        fontSize: 5.4,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  widget.info["type"]!,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: Colors.black54,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: (widget.size.height * 0.26) * 0.02,
                ),
                Expanded(
                  child: DottedBorder(
                    color: Colors.black12,
                    strokeWidth: 0.8,
                    child: Container(
                      height: (widget.size.height * 0.26) * 0.3,
                      // width: 90,
                      child: Column(
                        children: [
                          Text(
                            'Selected Service',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const Divider(height: 1),
                          SizedBox(
                            height: (widget.size.height * 0.26) * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.electric_car_outlined,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Battery Checkup',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (widget.size.height * 0.26) * 0.02,
            ),
            Expanded(
                child: isCompleted
                    ? CircleAvatar(
                        // radius: 28,
                        maxRadius: 32,
                        minRadius: 24,
                        backgroundColor: Theme.of(context).backgroundColor,
                        child: FittedBox(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                              ),
                              Text(
                                "2Hours",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      )
                    : Column(children: [
                        Text(
                          "Completed",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            fixedSize: Size(
                              widget.size.width * 0.3,
                              widget.size.height * 0.05,
                            ),
                          ),
                          child: Text(
                            "View Invoice",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 9),
                          ),
                        ),
                      ])),
          ],
        ),
      ),
    );
  }
}
