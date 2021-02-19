import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postammu/Adapter/cartAdapter.dart';
import 'package:postammu/Components/AppDrawer.dart';
import 'package:postammu/Models/mItemModel.dart';
import 'package:postammu/Style/ColorStyle.dart';
import 'package:postammu/Style/DisplayStyle.dart';
import 'package:postammu/Style/iconStyle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey _scaffoldKey = new GlobalKey();
    return Scaffold(
      key: _scaffoldKey,
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kBlueColor, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text("Header"),
                ),
                ListTile(
                  title: Text("Home"),
                )
              ],
            ),
          ),
        ),
        body: Container(
          color: kBackgroundColor,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new  Expanded(
                flex:2,
                child: Container(
                  color: kBackgroundColor,
                  width: 100,
                  child: Container(
                    child: new Column(
                      children: [

                        new Expanded(
                            flex:1,
                            child: _appBarMenu()
                        ),
                        new Expanded(
                            flex:5,
                            child: _gridItemsCategory()
                        )
                      ],
                    ),
                  )
                ),
              ),
              new Expanded(
                child:  new Column(
                  children: [
                    new Expanded(
                        child: new Container(
                          child: _rightCart(),
                        ),
                      flex: 2,
                    ),
                    new Expanded(
                      child: new Container(
                        child: _listCart(),
                      ),
                      flex: 7,
                    ),
                    new Expanded(
                      child: new Container(
                        child: _buttonPayment(),
                        color: kBackgroundColor,
                        padding: EdgeInsets.only(right: 2),
                      ),

                    )
                  ],
                ),
              )

//              new  Expanded(
//                child: Column(
//                    mainAxisSize: MainAxisSize.max,
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: [
//                      Container(
//                          color: kBackgroundColor,
//                          padding: EdgeInsets.only(right: 2),
//                          child: Align(
//                            alignment: Alignment.bottomCenter,
//                            child: _buttonPayment(),
//                          )
//                      )
//                    ],
//
//                    children: [
//                  Container(
//                    height: double.infinity,
//                    width: double.infinity,
//                    child: _rightCart(),
//                  ),
//                  Container(
//                      child: _listCart()
//                  ),
//                  Container(
//                      color: kBackgroundColor,
//                      padding: EdgeInsets.only(right: 2),
//                      child: Align(
//                        alignment: Alignment.bottomCenter,
//                        child: _buttonPayment(),
//                      )
//                  ),
//                ]),
//              ),
            ],
          ),
        )
    );
  }
}


//Drawer
final Widget _leftDrawer = Drawer(
  child: Column(
    children: <Widget>[
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/images/logo_1024.png'),
            ),
            ListTile(
              title: Text('Line 1'),
            ),
            ListTile(
              title: Text('Line 2'),
            ),
            AboutListTile(),
          ],
        ),
      ),
    ],
  ),
);


//AppBar
class _appBarMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Drawer app"),
      // ),
      // drawer: AppDrawer(),
        body: Stack(

            children: [
              Positioned(
                top: 50,
                left: 30.0,
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    child: ClipRRect(
                      child: Image.asset('assets/icons/menu.png',
                          width: 25.0, height: 25.0),
                    ),),
                ),

              ),
              Positioned(
                top: 50,
                right: 130.0,
                child: Image.asset(
                  'assets/icons/search.png',
                  height: 25,
                  width: 25,
                ),
              ),
              Positioned(
                top: 50,
                right: 86.0,
                child: Image.asset(
                  'assets/icons/calc.png',
                  height: 25,
                  width: 25,
                ),
              ),
              Positioned(
                top: 50,
                right: 40.0,
                child: Image.asset(
                  'assets/icons/list.png',
                  height: 25,
                  width: 25,
                ),
              )
            ]
        )

    );

   return Stack(

       children: [
         Positioned(
           top: 50,
           left: 30.0,

           child: Image.asset(
             'assets/icons/menu.png',
             height: 25,
             width: 25,
           ),
         ),
         Positioned(
           top: 50,
           right: 130.0,
           child: Image.asset(
             'assets/icons/search.png',
             height: 25,
             width: 25,
           ),
         ),
         Positioned(
           top: 50,
           right: 86.0,
           child: Image.asset(
             'assets/icons/calc.png',
             height: 25,
             width: 25,
           ),
         ),
         Positioned(
           top: 50,
           right: 40.0,
           child: Image.asset(
             'assets/icons/list.png',
             height: 25,
             width: 25,
           ),
         )
       ]
   );
  }
}


//Grid Items
class _gridItemsCategory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child:
      GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          mainAxisSpacing: 30.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return  Container(
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: kGreyColor,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 4.0,
                  ),
                ],

            ),
            child: new Stack(
              children: <Widget>[
                new Positioned(
                  right: 5.0,
                  top: 10.0,
                  child: new Image.asset(
                        items[index].image,
                          height: 151,
                          width: 151,
                    ),

                ),
                new Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: new Text(
                      items[index].name,
                    style: mItemsTitle
                  ),
                )
              ],
            ),

          );
        },
      ),
    );
  }
}


//RIGHT TITLE CART
class _rightCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        //TITLE CART
        children: [
          Positioned(
            top: 50,
            left: 16.0,
            child:
            Text(
                "Table 3 - ",
                style: mTitleCart
            )
          ),
          Positioned(
            top: 50,
            left: 103.0,
            child:Text(
              "Wood",
                style: mTitleCart
            )
          ),
          Positioned(
            top: 50,
            right: 16.0,
            child:Text(
                "#00001",
                style: mTitleCart
            ),
          ),

          //IMG CART
          Positioned(
              top: 75,
              left: 16.0,
              child:
              Image.asset(
                'assets/icons/tag.png',
                height: 25,
                width: 25,
              ),
          ),
          Positioned(
              top: 75,
              left: 110.0,
              child:
              Image.asset(
                'assets/icons/user.png',
                height: 25,
                width: 25,
              ),
          ),
          Positioned(
            top: 75,
            right: 16.0,
            child:
            Image.asset(
              'assets/icons/trash.png',
              height: 25,
              width: 25,
            ),
          ),
        ]
    );
  }
}

class _listCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: kSeparatedColor,
          ),
          padding: EdgeInsets.only(left: 16, right: 16),
          itemCount: carts.length,
          itemBuilder: (context, index) {
            return Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'X'+carts[index].qty,
                            style: GoogleFonts.questrial(
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                color: kGreyColor),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child:
                            Text(
                              carts[index].itemName,
                              style: GoogleFonts.questrial(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: kBlackColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, top: 2),
                            child:
                            Text(
                              carts[index].itemVariant,
                              style: GoogleFonts.questrial(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: kBlackColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child:
                        Text(
                          "Rp "+carts[index].totalPrice,
                          style: GoogleFonts.questrial(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: kBlackColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}

class _buttonPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kBlueColor,
          boxShadow: [
            BoxShadow(color: kBlueColor, spreadRadius: 3),
          ],
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Row(
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child:
                    Text(
                      'Charge',
                      style: GoogleFonts.questrial(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: kWhiteColor),
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(right: 8),
                child:
                Text(
                  "Rp 57.000",
                  style: GoogleFonts.questrial(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: kWhiteColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}





