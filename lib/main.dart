/*
* 仿写知识点：
* 1、文本及样式
* 2、图片
* 3、复选框
* 4、线性布局
*/

import 'package:flutter/material.dart';

main() => runApp(WBLMaterialApp());

class WBLMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WBLHome(),
    );
  }
}

class WBLHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "商品列表",
        ),
      ),
      body: WBLBody(),
    );
  }
}

class WBLBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title1 = 'MacBooks';
    var title2 = 'Lenovo Laptop';
    var title3 = 'Huawei Laptop';

    var describe1 = '使用独立的macOS系统，最新的macOS系列基于NeXT系统开发，不支持兼容。是一套完备而独立的操作系统。';
    var describe2 = '配备了高素质的售后服务和技术咨询队伍，提供了三年保修和及时、迅速的上门服务，让消费者真正做到“买得放心、用得安心！';
    var describe3 = '支持MatePen手写笔，这个和SurfacePen差不多，据现场体验该手写笔支持快速操作。';

    var imageURL1 =
        'https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg';
    var imageURL2 =
        'https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg';
    var imageURL3 =
        'https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg';

    return ListView(
      //使用ListView使能滚动
      children: [
        WBLProductItem(title1, describe1, imageURL1),
        WBLProductItem(title2, describe2, imageURL2),
        WBLProductItem(title3, describe3, imageURL3),
        WBLCheckbox(), //复选框
      ],
    );
  }
}

//商品widget
class WBLProductItem extends StatelessWidget {
  final String title; //商品标题
  final String describe; //商品描述
  final String imageURL; //商品图片

  WBLProductItem(this.title, this.describe, this.imageURL);

  @override
  Widget build(BuildContext context) {
    final style1 = TextStyle(
      fontSize: 30,
      color: Colors.red,
    );

    final style2 = TextStyle(
      fontSize: 17,
      color: Colors.black,
    );

    return Container( //给每个商品widget设置一个边框
      padding: EdgeInsets.all(5), //内边距
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Colors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //商品标题对齐方式
        children: [
          Text(
            title,
            style: style1,
          ),
          SizedBox(
            height: 8,
          ), //使上下之间有间距
          Text(
            describe,
            style: style2,
          ),
          SizedBox(
            height: 12,
          ),
          Image.network(
            imageURL,
            width: 400,
            height: 200,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

class WBLCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WBLCheckboxState();
  }
}

class WBLCheckboxState extends State<WBLCheckbox> {

  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: this.flag,
            onChanged: (value) {
              setState(() {
                if(value != null) flag = value;
              });
            },
          ),
          Text(
              "全部购买",
              style: TextStyle(
                fontSize: 22,
              )
          )
        ],
      ),
    );
  }
}
