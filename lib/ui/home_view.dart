import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:graduation_project_cryptowallet/ui/sell_view.dart';
// import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../net/api_methods.dart ';
import '../net/flutterfire.dart';
import './add_view.dart';
import 'add_view.dart';
import 'chat.dart';
import '../model/users.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

Users user = Users('');
TextEditingController _userIdController = TextEditingController();

class _HomeViewState extends State<HomeView> {
  double bitcoin = 0.0;
  double ethereum = 0.0;
  double tether = 0.0;

  @override
  initState() {
    updateValues();
  }

  updateValues() async {
    bitcoin = await getPrice("bitcoin");
    ethereum = await getPrice("ethereum");
    tether = await getPrice("tether");
    setState(() {});
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  getCurrentUser() async {
    final User user = await _auth.currentUser;
    final id = user.uid;

    // final _firebaseAuth = FirebaseAuth.instance;
    // Similarly we can get email as well
    //final uemail = user.email;
    // print(uid);
    //print(uemail);
  }

  // final FirebaseAnalytics id = FirebaseAnalytics.instance;
  // userid() async {
  //   await FirebaseAnalytics.instance.setUserId(id: '123');

  //   // final _firebaseAuth = FirebaseAuth.instance;
  //   // Similarly we can get email as well
  //   //final uemail = user.email;
  //   // print(uid);
  //   //print(uemail);
  // }

  @override
  Widget build(BuildContext context) {
    // FutureBuilder(
    //     future:  _getProfileData(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         _userIdController = user.accountId as TextEditingController;
    //       }
    //       return Padding(
    //         child: Text('accountId: ${user.accountId}'),
    //       );
    //     });

    // _getProfileData() async {
    //   final uid = await FirebaseAuth.instance.currentUser.uid;
    //   await FirebaseFirestore.instance.collection('Users').doc(uid).get().then(
    //     (result) {
    //       user.accountId = result.data()['accountId'];
    //     },

    //   );
    // }

    getValue(String id, double amount) {
      if (id == "bitcoin") {
        return (bitcoin * amount).toStringAsFixed(2);
      } else if (id == "ethereum") {
        return (ethereum * amount).toStringAsFixed(2);
      } else {
        return (tether * amount).toStringAsFixed(2);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BTM'),
        actions: [
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.support_agent_rounded,
                color: Theme.of(context).accentColor, size: 50),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(title: Text('Chat with us')),
                    body: Chat(),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpeg'),
                fit: BoxFit.cover, 
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // height: (MediaQuery.of(context).size.height) * 0.09,
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    alignment: Alignment.topRight,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Account Details',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              child: Scaffold(
                                //  Container(child: BackButton(), alignment: Alignment.topRight,),
                                body: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: SingleChildScrollView(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/background.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                border: Border.all(
                                                    color: Theme.of(context)
                                                        .highlightColor,
                                                    width: 7),
                                              ),
                                              child: Text(
                                                'Account Details',
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 100,
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      border: Border.all(
                                                          width: 5,
                                                          color: Theme.of(
                                                                  context)
                                                              .highlightColor),
                                                    ),
                                                    child: Text(
                                                      'Account Number: ',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            border: Border.all(
                                                                width: 2)),
                                                        child: RaisedButton(
                                                          child: Text(
                                                              'Edit Account Number'),
                                                          onPressed: () {
                                                            _userEditBottomSheet(
                                                                context);
                                                          },
                                                        ),
                                                        // child: Text(
                                                        //   _auth.currentUser.uid
                                                        //       .toString(),
                                                        //   style: TextStyle(
                                                        //     fontSize: 20,
                                                        //     color: Colors.black,
                                                        //   ),
                                                        // ),
                                                      ),
                                                      // Container(
                                                      //   padding:
                                                      //       EdgeInsets.all(10),
                                                      //   decoration: BoxDecoration(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10),
                                                      //       color: Theme.of(
                                                      //               context)
                                                      //           .primaryColorLight,
                                                      //       border: Border.all(
                                                      //           width: 2)),
                                                      //   child: Text(
                                                      //     _auth
                                                      //         .currentUser.email
                                                      //         .toString(),
                                                      //     style: TextStyle(
                                                      //         fontSize: 20,
                                                      //         color:
                                                      //             Colors.black),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 40,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      border: Border.all(
                                                          width: 5,
                                                          color: Theme.of(
                                                                  context)
                                                              .highlightColor),
                                                    ),
                                                    child: Text(
                                                      'Email: ',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Theme.of(context)
                                                            .primaryColorLight,
                                                        border: Border.all(
                                                            width: 2)),
                                                    child: Text(
                                                      _auth.currentUser.email
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Users')
                              .doc(FirebaseAuth.instance.currentUser.uid)
                              .collection('Coins')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView(
                              children: snapshot.data.docs.map((document) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: 30.0,
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    height:
                                        MediaQuery.of(context).size.height / 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          "Coin: ${document.id}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Text(
                                          " \$${getValue(document.id, document['Amount'])}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            await removeCoin(document.id);
                                          },
                                          icon: Icon(
                                            Icons.close,
                                          ),
                                          color: Colors.red,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          }),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    // padding: EdgeInsets.only(top: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sellview(),
                              ),
                            );
                          },
                          child: Text(
                            'Sell',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Theme.of(context).primaryColorLight,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddView(),
                              ),
                            );
                          },
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // floatingActionButton: Container(
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => AddView(),
      //         ),
      //       );
      //     },
      //     backgroundColor: Colors.blue,
      //     child: Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }
}

void _userEditBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * .60,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Update Profile'),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.cancel),
                      color: Colors.orange,
                      iconSize: 25,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextField(
                        controller: _userIdController,
                        decoration: InputDecoration(
                          helperText: 'Account Number',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Save'),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () async {
                        final uid = await FirebaseAuth.instance.currentUser.uid;
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(uid)
                            .set(user.toJson());
                        user.accountId = _userIdController.text;
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
