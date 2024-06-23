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
         FAQ(),
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
