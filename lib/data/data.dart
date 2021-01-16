import 'package:flutter/material.dart';
import 'package:my_protfolio/model/project_model.dart';

import '../assets.dart';
import 'dart:js' as js;

class Data {
  static List<String> menuItem = [
    "Home",
    "Myself",
    "Education",
    "Skills",
    "Projects",
    "Feedback",
    "Contact",
  ];

  static List<IconData> menuIcon = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.school_outlined,
    Icons.history_outlined,
    Icons.workspaces_outline,
    Icons.insert_comment_outlined,
    Icons.tty_outlined,
  ];

  static String aboutMe =
      'Mobile application developing, This is the only platform where i can handle problem easilsy. But i believe that Hard work is only the way to success.';

  static String bscDetails =
      'From Daffodil International University (DIU), Dhaka, Bangladesh \nDepartment of Computer Science & Engineering (CSE)';

  static String hscDetails =
      'Cantonment Public School & College (BUSMS), Parbatipur, Dinajpur \nScience Group';

  static String sscDetails =
      'Lalmonirhat Govt. High School, Thana Rd, LalmanirHat \nScience Group';

  static List<ProjectModel> projectsVersity = [
    ProjectModel(
      name: 'To Let',
      description: "Search house or office for rent or sell",
      course: 'Object Oriented Programming',
      releaseDate: 'Summer 2017',
      language: "Java",
      platform: "Android",
      type: Type.versity,
      kitOrEditor: "Android Studio",
      status: "Completed for the course",
      imagePath: [
        Assets.tolet1,
        Assets.tolet2,
        Assets.tolet3,
        Assets.tolet4,
        Assets.tolet5,
        Assets.tolet6,
      ],
      onTap: null,
    ),
    ProjectModel(
      name: 'Diu Donation',
      description:
          "Collect donation form diu students through \ntheir smart id card",
      course: 'Algorithms',
      releaseDate: 'Fall 2017',
      language: "Java",
      platform: "Android",
      type: Type.versity,
      kitOrEditor: "Android Studio",
      status: "Conpleted for the course",
      imagePath: [
        Assets.diuDonate1,
        Assets.diuDonate2,
        Assets.diuDonate3,
      ],
      onTap: null,
    ),
    ProjectModel(
      name: 'Combo Fighter',
      description: "Simple shooting game",
      course: 'Microprocessor and Assembly Language',
      releaseDate: 'Spring 2018',
      language: "Assembly",
      platform: "Windows",
      type: Type.versity,
      kitOrEditor: "Emu8086",
      status: "Completed",
      imagePath: [
        Assets.comboFighter1,
        Assets.comboFighter2,
        Assets.comboFighter3,
        Assets.comboFighter4,
      ],
      onTap: null,
    ),
    ProjectModel(
      name: 'Guess Sum',
      description: "",
      course: 'Wireless Programming',
      releaseDate: 'Summer 2019',
      language: "Java",
      platform: "Android",
      type: Type.versity,
      kitOrEditor: "Android Studio",
      status: "Completed",
      imagePath: [
        Assets.guessNumber21,
        Assets.guessNumber22,
        Assets.guessNumber23,
        Assets.guessNumber24,
        Assets.guessNumber25,
        Assets.guessNumber26,
        Assets.guessNumber27,
      ],
      onTap: null,
    ),
    ProjectModel(
      name: 'Quiz & Currency Converter',
      description: "",
      course: 'Web Engineering',
      releaseDate: 'Spring 2019',
      language: "Html, css, Javascript",
      platform: "Website",
      type: Type.versity,
      kitOrEditor: "Phpstorm",
      status: "Completed",
      imagePath: [
        Assets.quiz1,
        Assets.quiz2,
        Assets.quiz3,
        Assets.quiz4,
        Assets.quiz5,
      ],
      onTap: () {
        js.context.callMethod(
            'open', ['https://github.com/khalid1612/web-engineering']);
      },
    ),
    ProjectModel(
      name: 'Diu project store',
      description: "",
      course: 'Web Engineering',
      releaseDate: 'Spring 2019',
      language: "Html, css, Javascript",
      platform: "Website",
      type: Type.versity,
      kitOrEditor: "Phpstorm",
      status: "Completed for the course",
      imagePath: [Assets.diuProjectStore1],
      onTap: () {
        js.context.callMethod(
            'open', ['https://github.com/khalid1612/web-engineering']);
      },
    ),
    ProjectModel(
      name: '17DOF robot',
      description: "",
      course: 'Embedded Systems',
      releaseDate: 'Fall 2019',
      language: "C",
      platform: "Hardware",
      type: Type.versity,
      kitOrEditor: "Arduino",
      status: "Only setup.(Failed)",
      imagePath: [Assets.dof1, Assets.dof2],
      onTap: null,
    ),
    ProjectModel(
      name: 'No Title',
      description: "",
      course: 'Computer Graphics',
      releaseDate: 'Fall 2019',
      language: "OpenGl",
      platform: "Windows",
      type: Type.versity,
      kitOrEditor: "Code blocks",
      status: "Completed",
      imagePath: [Assets.opengl],
      onTap: null,
    ),
    ProjectModel(
      name: 'Prosiddho',
      description: "A ecommerce app",
      course: 'Final Project',
      releaseDate: 'Spring 2021',
      language: "Dart, Flutter",
      platform: "Android, Ios",
      type: Type.versity,
      kitOrEditor: "Visual studio code",
      status: "Completed for the course",
      imagePath: [
        Assets.prosiddho1,
        Assets.prosiddho2,
        Assets.prosiddho3,
        Assets.prosiddho4,
        Assets.prosiddho5,
        Assets.prosiddho6,
        Assets.prosiddho7,
        Assets.prosiddho8,
        Assets.prosiddho9,
        Assets.prosiddho10,
        Assets.prosiddho11,
        Assets.prosiddho12,
        Assets.prosiddho13,
        Assets.prosiddho14,
        Assets.prosiddho15,
        Assets.prosiddho16,
        Assets.prosiddho17,
        Assets.prosiddho18,
        Assets.prosiddho19,
      ],
      onTap: null,
    ),
  ];

  static List<ProjectModel> projectsPersonal = [
    ProjectModel(
      name: 'E2B DICTIONARY',
      description: "Made it for practice c, data structure",
      course: '',
      releaseDate: '2016',
      language: "C",
      platform: "Windows",
      type: Type.personal,
      kitOrEditor: "Code blocks",
      status: "Completed",
      imagePath: [
        Assets.dictionary1,
        Assets.dictionary2,
        Assets.dictionary3,
      ],
      onTap: null,
    ),
    ProjectModel(
      name: 'Guess number',
      description: "Guess a random genarated number",
      course: '',
      releaseDate: '2016',
      language: "Java",
      platform: "Android",
      type: Type.personal,
      kitOrEditor: "Android Studio",
      status: "Completed",
      imagePath: [
        Assets.guessNumber1,
        Assets.guessNumber2,
        Assets.guessNumber3,
        Assets.guessNumber4,
        Assets.guessNumber5,
      ],
      onTap: null,
    ),
    ProjectModel(
      name: 'EasyTMDB',
      description: "A library for movie fetch from TMDB",
      course: '',
      releaseDate: '2020',
      language: "Dart",
      platform: "Android, Ios",
      type: Type.future,
      kitOrEditor: "Visual studio code",
      status: "Completed",
      imagePath: [Assets.easytmdbLib],
      onTap: null,
    ),
  ];

  static List<ProjectModel> projectsFuture = [
    ProjectModel(
      name: 'Lets Walk',
      description: "",
      course: '',
      releaseDate: '01-03-2121',
      language: "Dart, Flutter",
      platform: "Android, Ios",
      type: Type.future,
      kitOrEditor: "Visual studio code",
      status: "Upcomming",
      imagePath: [Assets.upcomming],
      onTap: null,
    ),
    ProjectModel(
      name: 'Latara Bite',
      description: "Movie streaming app",
      course: '',
      releaseDate: '01-04-2121',
      language: "Dart, Flutter",
      platform: "Android, Ios",
      type: Type.future,
      kitOrEditor: "Visual studio code",
      status: "Upcomming",
      imagePath: [Assets.upcomming],
      onTap: null,
    ),
    ProjectModel(
      name: 'Family',
      description: "",
      course: '',
      releaseDate: '',
      language: "Dart, Flutter",
      platform: "Android, Ios, Web",
      type: Type.future,
      kitOrEditor: "Visual studio code",
      status: "Planning...",
      imagePath: [Assets.upcomming],
      onTap: null,
    ),
  ];
}
