import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badge/flutter_app_badge.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:we_ship_faas/app/core/get_di.dart';
import 'package:we_ship_faas/app/core/routes/app_pages.dart';
import 'package:we_ship_faas/presentation/bottom_nav/controllers/bottom_nav_controller.dart';

class AppPushNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.high,
    playSound: true,
    enableVibration: true,
    showBadge: true,
  );

  static initNotifications() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@drawable/ic_launcher'),
        iOS: DarwinInitializationSettings(
          defaultPresentBadge: true,
          requestBadgePermission: true,

          // onDidReceiveLocalNotification: (id, title, body, payload) {
          //   if (payload != null) {
          //     final data = jsonDecode(payload);
          //     if (data is! Map) return;
          //     redirectToScreen(data['type1']);
          //   }
          // },
        ),
      ),
      onDidReceiveNotificationResponse: (details) {
        final payload = details.payload;
        if (payload != null) {
          final data = jsonDecode(payload);
          if (data is! Map) return;
          redirectToScreen(data['type1']);
        }
      },
    );

    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    handleForeGroundPushNotifications();
  }

  static handleForeGroundPushNotifications() {
    FirebaseMessaging.onMessageOpenedApp.listen(_listener);
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        log('-------Push Notification Received--------');
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          showNotificationsPopUp(message);
        }
      },
    );
  }

  static void redirectToScreen(String type) {
    final bottomC = find<BottomNavController>();
    if (type == 'news') {
      bottomC.onTabChange(3);
    } else if (type == 'package') {
      Get.toNamed(AppPages.trackPackages, id: bottomC.bottomNavNestedID);
    } else if (type == 'invoice') {
      Get.toNamed(AppPages.invoices, id: bottomC.bottomNavNestedID);
    }
  }

  static void _listener(RemoteMessage message) {
    log('-------On Tap Listener--------');
    final data = message.data;
    redirectToScreen(data['type1']);
  }

  static void showNotificationsPopUp(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification?.title,
      notification?.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: Colors.transparent,
          playSound: true,
          enableVibration: true,
          icon: '@drawable/ic_launcher',
          channelShowBadge: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentSound: true,
          presentBadge: true,
          presentAlert: true,
          presentBanner: true,
          presentList: true,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }
}

/// this function will called in situations
/// when the app is in background
/// when the app is in terminate state
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('-------Push Notification Received--------');
  await Firebase.initializeApp();
  AppPushNotifications.showNotificationsPopUp(message);
  try {
    await find<FlutterAppNotificationBadger>().setBadgeCount();
  } catch (e) {
    debugPrint('FlutterAppNotificationBadger error: $e');
  }
}

class FlutterAppNotificationBadger {
  bool? isBadgerSupported;
  int lastCount = 0;

  FlutterAppNotificationBadger() {
    isSupported();
  }

  Future<void> setBadgeCount({int count = 0}) async {
    final c = lastCount++;
    await FlutterAppBadge.count(c);
  }

  Future<void> clearBadge() async {
    await FlutterAppBadge.count(0);
  }

  Future<void> isSupported() async {
    // if (isBadgerSupported != null) return;
    // if (isBadgerSupported == null) {
    //   final isSupported = await FlutterAppBadge.isAppBadgeSupported();
    //   isBadgerSupported = isSupported;
    // }
  }
}
