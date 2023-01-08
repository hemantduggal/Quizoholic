import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import '../Variables/conn.dart';

class AdManager {

  static String get gameId {
    if(otherAdsLinksList[30]=="1")
    {
      return '';
    }
    if (DateTime.now().hour % 2==0) {
      return '';
    }
    else{
      return '';
    }
  }

  static String get bannerAdPlacementId {
    if (DateTime.now().hour % 2==0) {
      return 'banner';
    }
    else
      {
        return 'banner';
      }
  }

  static String get interstitialVideoAdPlacementId {
    if (DateTime.now().hour % 2==0) {
      return 'intersial';
    }
    else
      {
        return 'intersial';
      }
  }

  static String get rewardedVideoAdPlacementId {
    if (DateTime.now().hour % 2==0) {
      return 'reward';
    }
    else
      {
        return 'reward';
      }
  }
}



void unityAdsInit()
{
  UnityAds.init(
    gameId: AdManager.gameId,
    testMode: false,
  );
}


void loadUnityReward()
{
  UnityAds.load(
    placementId: AdManager.rewardedVideoAdPlacementId,
    onComplete: autoShowVideoAd,
  );
}



void loadUnityInter()
{
  UnityAds.load(
    placementId: AdManager.interstitialVideoAdPlacementId,
    onComplete: autoShowVideoAd,
  );
}

void autoShowVideoAd(String placement) {
  UnityAds.showVideoAd(
    placementId: placement,
    onStart: (placementId) => {},
    onClick: (placementId) => {},
    onSkipped: (placementId) => {},
    onComplete: (placementId) => {},
    onFailed: (placementId, error, message) =>
    {},
  );
}
