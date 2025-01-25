import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/model/error_model.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../navigation/navigation.dart';

class NetworkFailure {
  static const String _internalServerError = 'Internal server error';
  static const String _notFoundError = 'Not found';
  static const String _unauthorizedError = 'Unauthorized';
  static const String _forbiddenError = 'Forbidden';
  static const String _timeoutError = 'Request timeout';
  static const String _tooManyRequestsError = 'Too many requests';
  static const String _serviceUnavailableError = 'Service unavailable';
  static const String _unknownError = 'Unknown error';
  static const String _badGetWay =
      'Bad Gateway: The server received an invalid response';

  static String errorHandler(Response? response) {
    if (response == null) {
      return _unknownError;
    }

    switch (response.statusCode) {
      case 500:
        return _internalServerError;
      case 502:
        return _badGetWay;
      case 503:
        return _serviceUnavailableError;
      case 400:
        try {
          final errorModel = ErrorModel.fromJson(response.data);
          return errorModel.errorDescription ?? "Error occurred";
        } catch (e) {
          return "Invalid error response: $e";
        }
      case 401:
        {
          handleUnAuthorizedError();
          return _unauthorizedError;
        }
      case 403:
        return _forbiddenError;
      case 404:
        return _notFoundError;
      case 408:
        return _timeoutError;
      case 429:
        return _tooManyRequestsError;
      default:
        return _unknownError;
    }
  }
}

void handleUnAuthorizedError() {
  showAdaptiveDialog(
      context: AppRouter.context,
      barrierDismissible: false,
      builder: (context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(content: alertDialogContent())
            : AlertDialog(content: alertDialogContent());
      });
}

Widget alertDialogContent() {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Session Expired",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          onTap: () {
            // AppRouter.goAndRemoveAll(AppRoutes.login);
          },
          buttonText: 'Login',
        )
      ],
    ),
  );
}
