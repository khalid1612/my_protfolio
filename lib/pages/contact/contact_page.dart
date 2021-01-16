import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/global_widgets/button.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';
import 'package:my_protfolio/global_widgets/heading.dart';
import 'package:my_protfolio/utils/utils.dart';

class ContactPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final CollectionReference emails =
      FirebaseFirestore.instance.collection('email');

  Future<void> addEmail(
    String name,
    String email,
    String subject,
    String msg,
  ) {
    // Call the user's CollectionReference to add a new user
    return emails
        .add({
          'name': name,
          'email': email,
          'subject': subject,
          'msg': msg,
          'time': FieldValue.serverTimestamp(),
        })
        .then((value) => showToast("Mail send successfully"))
        .catchError((error) => print("Failed to send mail: $error"));
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
            title: 'Get in touch',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //contact info
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _contactItem(
                      Icons.phone_outlined,
                      "Phone",
                      "+8801726546211",
                    ),
                    _contactItem(
                      Icons.mail_outline,
                      "Email",
                      "khalidhassan3011@gmail.com",
                    ),
                    _contactItem(
                      Icons.location_on_outlined,
                      "Location",
                      "Dhaka,Bangladesh",
                    ),
                  ],
                ),
              ),

              //mail box

              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name email
                    Row(
                      children: [
                        Expanded(
                          child: _textField(nameController, "Name"),
                        ),
                        Expanded(
                          child: _textField(emailController, "Email"),
                        ),
                      ],
                    ),

                    //subject
                    _textField(subjectController, "Subject"),

                    //message
                    _textField(messageController, "Message", maxLine: 5),

                    //submit button
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Button(
                          text: "Submit Message",
                          onTap: () async {
                            String name = nameController.text.trim();
                            String senderMail = emailController.text.trim();
                            String subject = subjectController.text.trim();
                            String msg = messageController.text.trim();

                            var badNames = Utils.badWordContains(name);
                            var badEmail = Utils.badWordContains(senderMail);
                            var badSubject = Utils.badWordContains(subject);
                            var badMsg = Utils.badWordContains(msg);
                            //validate name
                            if (name.length < 2) {
                              showToast("Enter valid name");
                            } else if (name.toLowerCase().contains("admin") ||
                                name.toLowerCase().contains("owner")) {
                              showToast("Admin or owner not allowed");
                            } else if (badNames.length != 0) {
                              showToast("Please don't use bad word $badNames");
                            } else if (!EmailValidator.validate(senderMail)) {
                              showToast("Please enter a valid email");
                            } else if (badEmail.length != 0) {
                              showToast("Please don't use bad word $badEmail");
                            } else if (subject.length < 2) {
                              showToast("Subject at least 2 charecters");
                            } else if (badSubject.length != 0) {
                              showToast(
                                  "Please don't use bad word $badSubject");
                            } else if (msg.length < 5) {
                              showToast("Message at least 5 charecters");
                            } else if (badMsg.length != 0) {
                              showToast("Please don't use bad word $badMsg");
                            } else {
                              //add in db
                              addEmail(
                                name,
                                senderMail,
                                subject,
                                msg,
                              );

                              //clear text
                              nameController.clear();
                              emailController.clear();
                              subjectController.clear();
                              messageController.clear();
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

  Widget _contactItem(
    IconData icon,
    String title,
    String subTitle,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.red,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              margin: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: TextStyles.fontSizeH3,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    subTitle,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: TextStyles.fontSizeSmaller,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  Widget _textField(
    TextEditingController controller,
    String hints, {
    int maxLine = 1,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        child: TextField(
          controller: controller,
          maxLines: maxLine,
          enableInteractiveSelection: false,
          autofocus: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            labelText: hints,
            labelStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: TextStyles.fontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            ),
            alignLabelWithHint: true,
          ),
        ),
      );

  showToast(String text) => Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
}
