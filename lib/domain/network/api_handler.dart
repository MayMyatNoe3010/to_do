import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class APIHandler {
  static Future<APIResponse?> handleThisPost<T extends Object>(
      Uri url, Object? body, int timeout, Function f) async {
    try {
      var response =
          await http.post(url, body: body).timeout(Duration(seconds: timeout));
      print("Post Response${response.body}");
      if (response.statusCode == 200) {
        dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
        log('resp###',
            name:
                resp['status'].toString() + ">>>" + resp['message'].toString());
        try {
          T userResponse = f.call(resp);
          log("Post Response", name: response.body.toString());
          return Success(code: 200, response: userResponse);
        } catch (e) {
          bool status = resp['status'];
          String message = resp['message'];
          return Failure(code: 401, response: message);
        }
      } else {
        log("Post Response", name: response.body.toString());
        return Failure(code: 400, response: response.body);
      }
    } on SocketException {
      log('no network', name: 'error');
      return Failure(
          code: 404, response: "Cannot connect to the server, try again later");
    } on TimeoutException {
      log('Failure', name: 'Invalid Response:');
      return Failure(code: 400, response: 'Connection Timeout');
    } catch (e) {
      //log('Failure Try Catch', 'Invalid Response:' + e.toString());

      return Failure(code: 400, response: e.toString());
    }
  }

  static Future<APIResponse?> handleThisGet<T extends Object>(
      Uri url, int timeout, Function f) async {
    try {
      var response = await http.get(url).timeout(Duration(seconds: timeout));
      log('HTTP response =>$url', name: response.body.toString());

      if (response.statusCode == 200) {
        dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
        T r = f.call(resp);
        return Success(code: 200, response: r);
      } else {
        log('Failure', name: response.toString());
        return Failure(code: 400, response: 'Invalid Response');
      }
    } on SocketException {
      log('no network', name: 'error');
      return Failure(
          code: 503, response: "No internet connection, try again later");
    } on TimeoutException {
      log('Failure', name: 'Invalid Response:');
      return Failure(code: 403, response: 'Connection Timeout');
    } catch (e) {
      log('Failure', name: 'Invalid Response:' + e.toString());
      return Failure(code: 400, response: 'Error');
    }
  }

  static Future<APIResponse?> handleThisPatch<T extends Object>(
      Uri url, Object? body, int timeout, Function f) async {
    try {
      var response =
          await http.patch(url, body: body).timeout(Duration(seconds: timeout));
      print("Patch Response${response.body}");
      if (response.statusCode == 200) {
        dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
        log('resp###',
            name:
                resp['status'].toString() + ">>>" + resp['message'].toString());
        try {
          T userResponse = f.call(resp);
          log("Post Response", name: response.body.toString());
          return Success(code: 200, response: userResponse);
        } catch (e) {
          bool status = resp['status'];
          String message = resp['message'];
          return Failure(code: 401, response: message);
        }
      } else {
        log("Patch Response", name: response.body.toString());
        return Failure(code: 400, response: response.body);
      }
    } on SocketException {
      log('no network', name: 'error');
      return Failure(
          code: 404, response: "Cannot connect to the server, try again later");
    } on TimeoutException {
      log('Failure', name: 'Invalid Response:');
      return Failure(code: 400, response: 'Connection Timeout');
    } catch (e) {
      //log('Failure Try Catch', 'Invalid Response:' + e.toString());

      return Failure(code: 400, response: e.toString());
    }
  }

  static Future<APIResponse?> handleThisDelete<T extends Object>(
      Uri url,int timeout, Function f) async {
    try{
      var response = await http.delete(url).timeout(Duration(seconds: timeout));
      print('Delete Response : ${response.body}');
      if(response.statusCode == 200){
        dynamic resp = jsonDecode(utf8.decode(response.bodyBytes));
        try{
          T userResponse = f.call(resp);
          return Success(code: 200, response: response.body.toString());
        }catch(e){
          String message = resp['status'];
          return Failure(code: 401, response: message);
        }
      }else{
        log('Delete Response', name: '${response.body}');
        return Failure(code: 400, response: response.body);
      }
    } on SocketException{
      return Failure(code: 404, response: 'Cannot connect to the server, try again later');
    }on TimeoutException{
      return Failure(code: 400, response: 'Connection Timeout');
    }catch(e){
      return Failure(code: 400, response: e.toString());
    }
  }
}
