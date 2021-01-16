import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_protfolio/data/data.dart';
import 'package:my_protfolio/global_widgets/common_exports.dart';
import 'package:my_protfolio/global_widgets/heading.dart';
import 'package:my_protfolio/model/project_model.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  Type currentType = Type.versity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 150.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(
            title: 'Projects',
          ),

          //type
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _type(Type.versity, true, false, false),
              _type(Type.personal, false, false, false),
              _type(Type.future, false, true, false),
            ],
          ),

          SizedBox(height: 80),
          //versity project
          if (currentType == Type.versity)
            Wrap(
              runSpacing: 50.0,
              spacing: 40.0,
              children: [
                ...List.generate(
                  Data.projectsVersity.length,
                  (index) => _project(Data.projectsVersity[index]),
                ),
              ],
            ),

          //personal project
          if (currentType == Type.personal)
            Wrap(
              runSpacing: 50.0,
              spacing: 40.0,
              children: [
                ...List.generate(
                  Data.projectsPersonal.length,
                  (index) => _project(Data.projectsPersonal[index]),
                ),
              ],
            ),

          //future project
          if (currentType == Type.future)
            Wrap(
              runSpacing: 50.0,
              spacing: 40.0,
              children: [
                ...List.generate(
                  Data.projectsFuture.length,
                  (index) => _project(Data.projectsFuture[index]),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _project(ProjectModel project) {
    final List<String> fillImageList = [
      "To Let",
      "Guess Sum",
      "Prosiddho",
      "Guess number",
    ];
    final bool isFill = fillImageList.contains(project.name) ? true : false;

    return Column(
      children: [
        //image
        Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(project.imagePath[0]),
              fit: isFill ? BoxFit.fitHeight : BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
            ),
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: ColorPalette.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  //platform
                  child: Text(
                    project.platform.capitalize,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: TextStyles.fontSizeSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //name
        MouseRegion(
          cursor: project.onTap == null
              ? SystemMouseCursors.basic
              : SystemMouseCursors.click,
          child: GestureDetector(
            onTap: project.onTap,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 10,
              ),
              child: Text(
                project.name.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: TextStyles.fontSizeH3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),

        _kitLanguageYear(project),

        //course
        if (project.type == Type.versity)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "Course: " + project.course.capitalize,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: TextStyles.fontSizeSmaller,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
            ),
          ),

        //status
        if (project.type == Type.versity)
          Text(
            "Status: " + project.status,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: TextStyles.fontSizeSmaller,
                fontWeight: FontWeight.w400,
                color: project.status.toLowerCase() == "completed"
                    ? Colors.green
                    : project.status.toLowerCase().contains("failed")
                        ? Colors.red
                        : Colors.blue,
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            project.description,
          ),
        ),
      ],
    );
  }

  Widget _kitLanguageYear(ProjectModel project) => Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //kit or editor
          Text(
            project.type == Type.future ? project.status : project.kitOrEditor,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: TextStyles.fontSizeSmaller,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(
              top: 8,
            ),
            child: CircleAvatar(
              radius: 2,
              backgroundColor: Colors.red,
            ),
          ),

          //language
          if (project.type != Type.future)
            Text(
              project.language,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: TextStyles.fontSizeSmaller,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff888888),
                ),
              ),
            ),
          if (project.type != Type.future)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(
                top: 8,
              ),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: Colors.red,
              ),
            ),

          //time
          Text(
            project.releaseDate,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: TextStyles.fontSizeSmaller,
                fontWeight: FontWeight.w400,
                color: Color(0xff888888),
              ),
            ),
          ),
        ],
      );

  Widget _type(
    Type type,
    bool isFirst,
    bool isLast,
    bool isSelected,
  ) =>
      InkWell(
        onTap: () {
          if (type != currentType) {
            setState(() {
              currentType = type;
            });
          }
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            color:
                type == currentType ? ColorPalette.primary : Colors.transparent,
            border: Border.all(
              color: ColorPalette.primary,
            ),
            borderRadius: isLast
                ? BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )
                : isFirst
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    : BorderRadius.zero,
          ),
          child: Text(
            type.toString().split(".")[1].capitalize,
            style: TextStyle(
              color: type == currentType ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
}
