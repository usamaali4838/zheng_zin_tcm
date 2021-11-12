import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6ca3b),
      appBar: AppBar(
        title: Center(
          child: Text('关于我们 About Us'),
        ),
        backgroundColor: Color(0xfff6ca3b),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //circle avatar means profile and with one image
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Image.asset('images/2.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/Profile.jpg'),
                          radius: 90.0,
                        ),
                      ),
                    ),
                  ],
                ),
                // some chinese text
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20,
                  ),
                  child: Text(
                    '黄先生结合运动科学知识和传统中医方法，运用推拿针灸和中草药治疗运动损伤和疼痛。',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                //some english text
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20,
                  ),
                  child: Text(
                    'Mr Wong combines the Sport Science knowledge and the Traditional Chinese Medicine methods with the use of tuina acupuncture and Chinese herbs to treat sports injuries and pain.',
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                //location, tel number and consultation hours details
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 8.0,
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'injuries and pain Blk 498 Jurong West St 41 # 01-450 Singapore 640498',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 8.0,
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Tel : 68970778 96225569',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 8.0,
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.watch_later,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Consultation Hours : Daily ( incl PH ) 10 am - 9 pm',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //horizental line
                Divider(
                  color: Colors.black,
                  height: 40.0,
                  indent: 100,
                  endIndent: 100,
                  thickness: 1.5,
                ),
                // case study heading with fontsize 32
                Text(
                  '案例分析 Case Study',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 32.0,
                    color: Colors.black87,
                  ),
                ),
                //review/cupping image
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Image.asset('images/review.jpeg'),
                  ),
                ),
                // some chinese and english text
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20,
                  ),
                  child: Text(
                    '哪里有停滞，哪里就会有痛苦。 消除停滞，你就消除了痛苦。 痛则不通，不通则痛。 拔罐打开经络——生命能量通过这些通道在全身各组织器官中自由流动，从而提供更顺畅、更自由流动的气（生命力）。 拔罐是治疗腰背酸痛、肌肉僵硬、焦虑、疲劳、偏头痛、流感、经痛和体重减轻等的传统中医方法之一。',
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20,
                  ),
                  child: Text(
                    'Where there is stagnation , there will be pain . Remove the stagnation , and you remove the pain . 痛 则 不通 , 不 通则 痛 . Cupping opens the meridian channels - the paths through which life energy flows freely throughout the body , through all tissues and organs , thus providing a smoother and more free - flowing qi ( life force ) . Cupping is one of the Traditional Chinese Medicine methods to treat back and neck pains , stiff muscles , anxiety , fatigue , migraine , flu , menstrual pain and weight loss , etc.',
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
