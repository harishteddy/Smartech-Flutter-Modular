import 'package:flutter/material.dart';
import 'package:smartech_app/app_inbox/model/smt_appinbox_model_class.dart';
import 'package:smartech_app/app_inbox/utils/utils.dart';

class SMTCarouselNotificationView extends StatefulWidget {
  final SMTInbox inbox;
  const SMTCarouselNotificationView({Key? key, required this.inbox}) : super(key: key);

  @override
  State<SMTCarouselNotificationView> createState() => _SMTCarouselNotificationViewState();
}

class _SMTCarouselNotificationViewState extends State<SMTCarouselNotificationView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.inbox.publishedDate!.getTimeAndDayCount(),
                style: TextStyle(fontSize: 12, color: AppColor.greyColorText, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.inbox.title,
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.inbox.body,
              style: TextStyle(fontSize: 14, color: AppColor.greyColorText, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: 175,
                child: PageView.builder(
                    itemCount: widget.inbox.carousel.length,
                    controller: _pageController,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Image.network(
                                  widget.inbox.carousel[index].imgUrl,
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 8,
                                child: InkWell(
                                  onTap: () {
                                    _pageController.jumpToPage(index - 1);
                                  },
                                  child: Container(
                                    color: Colors.white.withOpacity(0.6),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        size: 26,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 8,
                                child: InkWell(
                                  onTap: () {
                                    if (index != widget.inbox.carousel.length - 1) _pageController.jumpToPage(index + 1);
                                  },
                                  child: Container(
                                    color: Colors.white.withOpacity(0.6),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 26,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${widget.inbox.carousel[index].imgTitle.toString()}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${widget.inbox.carousel[index].imgMsg.toString()}',
                            style: TextStyle(
                              color: AppColor.greyColorText,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    }),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
