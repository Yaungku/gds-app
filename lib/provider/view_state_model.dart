import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gds/generated/l10n.dart';
import 'package:oktoast/oktoast.dart';

import 'view_state.dart';

export 'view_state.dart';

class ViewStateModel with ChangeNotifier {
  /// avoid for unexpected dispose, i config
  ///  the proccess will be auto disposed after async proccess done
  bool _disposed = false;

  /// showing current status is, click F12 at View state to know what i mean
  ViewState _viewState;

  /// showing current viewstate's model at terminal
  /// easy to debug ah
  /// FooModel():super(viewState:ViewState.busy);
  ViewStateModel({ViewState viewState})
      : _viewState = viewState ?? ViewState.idle {
    debugPrint('ViewStateModel---constructor--->$runtimeType');
  }

  /// ViewState
  ViewState get viewState => _viewState;

  set viewState(ViewState viewState) {
    _viewStateError = null;
    _viewState = viewState;
    notifyListeners();
  }

  /// ViewStateError
  ViewStateError _viewStateError;

  ViewStateError get viewStateError => _viewStateError;

  /// Customize viewState idea from mvvm reports
  /// get maybe got wrong state, still need to think app's running is work or not
  bool get isBusy => viewState == ViewState.busy;

  bool get isIdle => viewState == ViewState.idle;

  bool get isEmpty => viewState == ViewState.empty;

  bool get isError => viewState == ViewState.error;

  /// set
  void setIdle() {
    viewState = ViewState.idle;
  }

  void setBusy() {
    viewState = ViewState.busy;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }


  void onError(ViewStateError viewStateError) {}

  /// showing error
  showErrorMessage(context, {String message}) {
    if (viewStateError != null || message != null) {
      if (viewStateError.isNetworkTimeOut) {
        message ??= S.of(context).viewStateMessageNetworkError;
      } else {
        message ??= viewStateError.message;
      }
      Future.microtask(() {
        showToast(message, context: context);
      });
    }
  }

  @override
  String toString() {
    return 'BaseModel{_viewState: $viewState, _viewStateError: $_viewStateError}';
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    debugPrint('view_state_model dispose -->$runtimeType');
    super.dispose();
  }
}

/// [e]will be Error , Exception ,String
/// [s]will be s
printErrorStack(e, s) {
  debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
$e
<-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
  if (s != null) debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
$s
<-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
    ''');
}
