import 'package:myapp/models/user.dart';
import 'package:flutter/material.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage>
    with TickerProviderStateMixin {
  List<User> _selectedUsers = [];

  final List<User> _users = [
    User(
        '1. フルネーム: 2022年 4月 11日 08:30',
        '',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false),
    User(
        '2. 性別: 男性 140 cm 37 kg',
        'まだ閉じられていない質問があります',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false),
    User(
        '3. 治験薬の服薬: 有',
        '答えは編集されました 修正理由 : 入力ミス',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false),
    User(
        '4. フルネーム: 2022年 4月 11日 08:30',
        '',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false),
    User(
        '5. 性別: 男性 140 cm 37 kg',
        '',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        '6. 治験薬の服薬: 有',
        '答えは編集されました',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            '情報確認',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(right: 0, left: 0),
          padding: EdgeInsets.only(right: 10, left: 10),
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              return userComponent(user: _users[index]);
            },
          ),
        ),
        floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            shadowColor: Colors.greenAccent,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
            maximumSize: const Size(100, 40), //////// HERE,
          ),
          onPressed: () {},
          child: const Text('送信'),
        ));
  }

  userComponent({required User user}) {
    return Container(
      padding: EdgeInsets.only(top: 25, bottom: 25),
      decoration: BoxDecoration(
        //                    <-- BoxDecoration
        border: Border(bottom: BorderSide()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            // Container(
            //     width: 60,
            //     height: 60,
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(50),
            //       child: Image.network(user.image),
            //     )),
            // SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              // Icon(
              //   Icons.warning,
              //   color: Colors.pink,
              //   size: 24.0,
              //   semanticLabel: 'MaterialIcons',
              // ),
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 12),
                  children: [
                    WidgetSpan(
                      child: user.username != ''
                          ? Icon(Icons.warning_rounded)
                          : Icon(null),
                    ),
                    TextSpan(
                      style: TextStyle(
                          color: Color.fromARGB(255, 231, 14, 14)
                              .withOpacity(0.6)),
                      text: user.username,
                    )
                  ],
                ),
              ),
            ]),
          ]),
          Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffeeeeee)),
                borderRadius: BorderRadius.circular(50),
              ),
              child: MaterialButton(
                elevation: 0,
                color:
                    user.isFollowedByMe ? Color(0xffeeeeee) : Color(0xffffff),
                onPressed: () {
                  setState(() {
                    user.isFollowedByMe = !user.isFollowedByMe;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(user.isFollowedByMe ? '再回答' : '再回答',
                    style: TextStyle(color: Colors.black)),
              )),
        ],
      ),
    );
  }
}
