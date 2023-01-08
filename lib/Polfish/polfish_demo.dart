
import 'package:flutter_pollfish/flutter_pollfish.dart';

const String androidApiKey = 'aa536bde-88f7-45e3-bea8-ec45b10ff7d6';
const String iOSApiKey = '';
const bool releaseMode = true;
const int indicatorPadding = 20;
const Position indicatorPosition = Position.middleRight;
const String? requestUUID = null;
const userProperties = {'gender': '1', 'education': '1'};
const clickId = null;
String _logText = '';

bool _showButton = false;
bool _completedSurvey = false;
int _currentIndex = 0;
int _cpa = 0;



Future<void> initPollfish() async {
  String logText = 'Initializing Pollfish...';

  _showButton = false;
  _completedSurvey = false;

  FlutterPollfish.instance.init(
      androidApiKey: androidApiKey,
      iosApiKey: iOSApiKey,
      indicatorPosition: indicatorPosition,
      indicatorPadding: indicatorPadding,
      rewardMode: (_currentIndex == 1 || _currentIndex == 2),
      releaseMode: releaseMode,
      offerwallMode: (_currentIndex == 2) ? true : false,
      requestUUID: requestUUID,
      userProperties: userProperties,
      clickId: clickId);

  FlutterPollfish.instance
      .setPollfishSurveyReceivedListener(onPollfishSurveyReceived);

  FlutterPollfish.instance
      .setPollfishSurveyCompletedListener(onPollfishSurveyCompleted);


  _logText = logText;

}


void onPollfishSurveyReceived(SurveyInfo? surveyInfo) => (() {
  if (surveyInfo == null) {
    _logText = 'Offerwall Ready';
    FlutterPollfish.instance.show();
  } else {
    _logText =
    'Survey Received: - ${surveyInfo.toString().replaceAll("\n", " ")}';
    _cpa = surveyInfo.surveyCPA ?? 0;
    FlutterPollfish.instance.show();
  }

  print(_logText);

  _completedSurvey = false;
  _showButton = true;
});

void onPollfishSurveyCompleted(SurveyInfo? surveyInfo) => (() {
  _logText = 'Survey Completed: - ${surveyInfo.toString()}';

  print(_logText);

  if (_currentIndex == 1) {
    _showButton = false;
    _completedSurvey = true;
  }
});
