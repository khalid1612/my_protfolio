import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/global_widgets/button.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';
import 'package:my_protfolio/global_widgets/heading.dart';
import 'package:my_protfolio/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController feedbackController = TextEditingController();

  final CollectionReference feedbacks =
      FirebaseFirestore.instance.collection('feedback');

  final _controller = ScrollController();
  bool editMode = false;

  Future<void> addFeedback(
    String name,
    String msg,
  ) {
    // Call the user's CollectionReference to add a new user
    return feedbacks
        .add({
          'name': name,
          'msg': msg,
          'time': FieldValue.serverTimestamp(),
        })
        .then((value) => print("Feedback successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 150.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(
            title: 'Feedback',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //all feedback
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  // padding: EdgeInsets.symmetric(horizontal: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 300,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: feedbacks
                        .orderBy(
                          "time",
                        )
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }

                      if (!editMode)
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_controller.hasClients) {
                            _controller.animateTo(
                              _controller.position.maxScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                        });

                      return ListView(
                        controller: _controller,
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                          String name = document.data()['name'];
                          bool isAdmin = name == "Khalid@owner" ? true : false;

                          return ChatBubble(
                            clipper: ChatBubbleClipper6(
                              type: isAdmin
                                  ? BubbleType.receiverBubble
                                  : BubbleType.sendBubble,
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                            ),
                            backGroundColor:
                                isAdmin ? ColorPalette.primary : Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: isAdmin ? "Khalid" : name,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: isAdmin
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: TextStyles.fontSizeH3,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        children: [
                                          if (isAdmin)
                                            TextSpan(
                                              text: " @owner",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: TextStyles
                                                      .fontSizeSmaller,
                                                  fontWeight: FontWeight.w200,
                                                  color: isAdmin
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (editMode)
                                      InkWell(
                                        onTap: () {
                                          feedbacks
                                              .doc(document.id)
                                              .delete()
                                              .then((value) =>
                                                  print("delete successfully"))
                                              .catchError((error) => print(
                                                  "Failed to delete: $error"));
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  document.data()['time'] == null
                                      ? ""
                                      : document
                                          .data()['time']
                                          .toDate()
                                          .toString(),
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      fontSize: TextStyles.fontSizeSmaller,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          isAdmin ? Colors.white : Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  document.data()['msg'],
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(),
                                    color:
                                        isAdmin ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),

              //field

              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: "Name",
                        labelStyle: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: TextStyles.fontSizeSmall,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    //details
                    TextField(
                      controller: feedbackController,
                      maxLines: 8,
                      enableInteractiveSelection: false,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelText: "What's on your mind for me",
                        labelStyle: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: TextStyles.fontSizeSmall,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),

                    //submit
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Button(
                          text: "Review",
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            String name = nameController.text.trim();
                            String msg = feedbackController.text.trim();

                            if (name == "Khalid-EnterEditMode") {
                              if (!editMode) {
                                setState(() {
                                  editMode = true;
                                });
                              }
                            } else if (name == "Khalid-EnterEditModeExit-") {
                              if (editMode) {
                                setState(() {
                                  editMode = false;
                                });
                              }
                            } else {
                              var badNames = Utils.badWordContains(name);
                              var badFeedbacks = Utils.badWordContains(msg);
                              //validate name
                              if (name.length < 2) {
                                showToast("Enter valid name");
                              } else if (name.toLowerCase().contains("admin")) {
                                showToast("Admin not allowed");
                              } else if (name.toLowerCase().contains("owner") &&
                                  !name
                                      .toLowerCase()
                                      .contains("Khalid@owner")) {
                                showToast("Owner not allowed");
                              } else if (badNames.length != 0) {
                                showToast(
                                    "Please don't use bad word $badNames");
                              } else if (msg.length < 10) {
                                showToast("Message at least 10 charecters");
                              } else if (badFeedbacks.length != 0) {
                                showToast(
                                    "Please don't use bad word $badFeedbacks");
                              } else {
                                //add in db
                                addFeedback(
                                  name,
                                  msg,
                                );

                                //clear text
                                nameController.clear();
                                feedbackController.clear();
                              }
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showToast(String text) => Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
