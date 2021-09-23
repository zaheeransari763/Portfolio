import 'dart:ui';

import 'package:flutter/material.dart';

const Color PrimaryColor = Color.fromRGBO(21, 181, 114, 1);
const Color BackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color ButtonColor = Color.fromRGBO(249, 77, 30, 1);
const Color CaptionColor = Color.fromRGBO(166, 177, 187, 1);

String gym="Smart Gym Management System is an easy way to use gym and health fitness membership system. It can help to keep records of members and their memberships, and give permit communication between members. This has membership management system which helps to keep records of clients and their membership details. The system will be accessible for both the male and female clients. This application is the entire backend of the gym management because it  have the entire details regarding the clients in the gym, number of trainers training the clients. The main responsibility of this application is to handle all the records of client’s payments which is very important aspects.";
String diet="This application is designed so as to be used by people who are health conscious and wanted to live a healthy life.It fulfils their expectation & requirement of the diets, exercises and many more.Every features of this system works on calculated BMI includes exercises to be physical active and also expert dietitian can be contacted if needed.It recommends customized diets with different food variety and nutrition's according to the BMI of the user. The application predicts the current body shape and health also alternatively suggests (under weight , over weight or physically fit).On upon facing any issues or having any queries can be directly rectified by communicating to expert dietitians.";
String aio="University AIO ANDROID APP is a system which maintains the information about the books used in the syllabus , a platform to discuss the queries about the topics and respond accordingly. Contains a well extracted PPT (PowerPoint Presentations) for better understandability and also consists of video lectures.Includes a public discussion section for query resolution.The University AIO ANDROID APP has been designed to computerize and automate the operations performed over the information about the members, books, queries the students facing and all other operations.This computerization of library and online discussion platform helps in many instances and make the curriculum activities over the internet.";
String chat="The chat application implemented have a unique features that allow our favorites ones to be connected with us from anywhere and anytime. This system will allow users to text the users they want although it will also have a feature of text to speech recognition which read aloud the text written. Multiple attractive emoji’s will be provided to express user’s emotion more clearly. However the main aim of this application is to time by replacing the traditional way of communication who are at long distance.For making the communication effective the system must be installed at both the ends for sending and receiving messages.";
// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;