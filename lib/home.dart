import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabbar_getx/controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeView extends StatelessWidget {
   HomeView({super.key});
  final controller=Get.put(TabBarController(),);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        centerTitle: true,
        leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back_ios),),
        /*TabBar start here*/
        bottom: TabBar(
         // dividerColor: Colors.transparent,
        //  indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
         // indicatorWeight: 4,
          indicatorColor: Colors.green,
          //indicatorSize: TabBarIndicatorSize.label,//the selected tab indicator will be sized according to the label of the tab.
          indicatorSize: TabBarIndicatorSize.tab,//the selected tab indicator will be sized to match the width of the tab.i
          controller: controller.tabController,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('FAQs'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Contact'),
            ),
          ],
        ),
        /*TabBar end here*/
      ),
     body:TabBarView(
       controller: controller.tabController,
       children: [
         //FAQ(),
         FAQsTab(),
         ContactUs(),

     ],),
    );
  }
}
/*ContactUs start here*/
class ContactUs extends StatelessWidget {
  // final List<Map<String, String>> items = [
  //   {'title': 'WhatsApp', 'asset': 'assets/images/whatsapp.svg'},
  //   {'title': 'Instagram', 'asset': 'assets/images/instagram.svg'},
  //   {'title': 'Facebook', 'asset': 'assets/images/facebook.svg'},
  //   {'title': 'Twitter', 'asset': 'assets/images/twitter.svg'},
  // ];
  final List<Map<String, String>> items = [
    {'title': 'WhatsApp', 'asset': 'assets/images/whatsapp.svg', 'url': 'https://www.whatsapp.com'},
    {'title': 'Twitter', 'asset': 'assets/images/twitter.svg', 'url': 'https://www.twitter.com'},
    {'title': 'Facebook', 'asset': 'assets/images/facebook.svg', 'url': 'https://www.facebook.com'},
    {'title': 'Instagram', 'asset': 'assets/images/instagram.svg', 'url': 'https://www.instagram.com'},
    {'title': 'Website', 'asset': 'assets/images/website.svg', 'url': 'https://www.website.com/?source=SC'},

  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10,),
      SizedBox(
        height: Get.height*0.8,
        child: ListView.builder(
          itemCount: items.length,
            itemBuilder:  (context,index){
          return Container( 
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: ListTile(
              onTap:() async{
                final url = items[index]['url']!;

                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: SvgPicture.asset(items[index]['asset']!,height: 40,width: 40,),
              title: Text(items[index]['title']! ,style: TextStyle(
                color: Color(0xFF212121),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            ),
          );
        }),
      ),

    ],);
  }
}

/*ContactUs end here*/
/*FAQS start here*/
class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(

          dividerColor: Colors.transparent,
indicatorColor: Colors.transparent,
tabs: [
  Container(
    color: Colors.red,
    child: Center(
      child: Text(
        'View 1',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  ),
  Container(
    color: Colors.green,
    child: Center(
      child: Text(
        'View 2',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  ),
  Container(
    color: Colors.blue,
    child: Center(
      child: Text(
        'View 3',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  ),
  Container(
    color: Colors.yellow,
    child: Center(
      child: Text(
        'View 4',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    ),
  ),
],
        ),
      ),
    ),);
  }
}


/*FAQS end here*/
/*FAQsTab start here*/
class FAQsTab extends StatelessWidget {
  FAQsTab({super.key});

  List faqItems = ['General', 'Accounts', 'Services', 'Payments'];
  final FAQController controller = Get.put(
    FAQController(),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          /*first portion start here*/
          SizedBox(
            height: 60,
            child: ListView.builder(
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              // padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) =>
                  Obx(
                        () =>
                        GestureDetector(
                          onTap: () {
                            controller.updateIndex(index);
                          },
                          child: Container(
                            // width: 10,
                            margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                            padding: EdgeInsets.symmetric(horizontal: 38),
                            decoration: BoxDecoration(
                              border: Border.all(
                                // color: controller.selectedIndex.value == index
                                //     ? Color(0xFF1BAC4B)
                                //     : Colors.grey[300] ?? const Color(0xFFB0BEC5),
                                color: controller.selectedIndex.value == index
                                    ? const Color(0xFF1BAC4B)
                                    : const Color(0xFF1BAC4B),
                              ),
                              //color: Color(0xFF1BAC4B),
                              color: controller.selectedIndex.value == index
                                  ? Color(0xFF1BAC4B)
                                  : Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                faqItems[index],
                                style: TextStyle(
                                  color: controller.selectedIndex.value == index
                                      ? Color(0xFFFFFFFF)
                                      : Color(0xFF1BAC4B),
                                  //   color: Color(0xFFFFFFFF),
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
            ),
          ),

          /*first portion end here*/
          const SizedBox(
            height: 10,
          ),
          /*second portion start here*/
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFFEFEFEF),
              ),
            ),
            child: ExpansionTile(
              title: Text(
                'How do I know my order status',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF212121),
                ),
              ),
              children: [
                Divider(
                  color: Color(0xFFFFEFEFEF),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'After you place your order, it is sent immediately to the bliss kitchen, which starts preparing it without any delay. The kitchen does everything to process your order as quickly as possible. However, sometimes we receive a large amount of orders, or drivers get stuck in heavy traffic this might cause little delays. If the amount of time you\'ve waited has exceeded the estimated delivery time, you may please contact us. You will receive an SMS as soon as your order is dispatched.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.5,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*second portion end here*/

          /*third portion start here*/
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFFEFEFEF),
              ),
            ),
            child: ExpansionTile(
              title: Text(
                'How much time it takes to deliver?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF212121),
                ),
              ),
              children: [
                Divider(
                  color: Color(0xFFFFEFEFEF),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'After you place your order, it is sent immediately to the bliss kitchen, which starts preparing it without any delay. The kitchen does everything to process your order as quickly as possible. However, sometimes we receive a large amount of orders, or drivers get stuck in heavy traffic this might cause little delays. If the amount of time you\'ve waited has exceeded the estimated delivery time, you may please contact us. You will receive an SMS as soon as your order is dispatched.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.5,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*third portion end here*/

          /*four portion start here*/
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xFFEFEFEF),
              ),
            ),
            child: ExpansionTile(
              title: Text(
                'Do I have to create an account for order',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF212121),
                ),
              ),
              children: [
                Divider(
                  color: Color(0xFFFFEFEFEF),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'After you place your order, it is sent immediately to the bliss kitchen, which starts preparing it without any delay. The kitchen does everything to process your order as quickly as possible. However, sometimes we receive a large amount of orders, or drivers get stuck in heavy traffic this might cause little delays. If the amount of time you\'ve waited has exceeded the estimated delivery time, you may please contact us. You will receive an SMS as soon as your order is dispatched.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.5,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*four portion end here*/
        ],
      ),
    );
  }
}