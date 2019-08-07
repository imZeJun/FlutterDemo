package com.lizejun.flutter_app;

import android.os.Bundle;
import android.widget.Toast;

import java.util.HashMap;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private MethodChannel mMethodChannel;
    private int mNumber = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        mMethodChannel = new MethodChannel(getFlutterView(),
                "samples.flutter.io/messages");
        methodChannelReceiver();
    }

    @Override
    protected void onResume() {
        super.onResume();
        System.out.println("onResume");
        methodChannelSender();
    }

    private void methodChannelReceiver() {
        mMethodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {

            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                System.out.println("MethodCall");
                switch (methodCall.method) {
                    case "toast":
                        if (methodCall.hasArgument("content")) {
                            String content = methodCall.argument("content");
                            Toast.makeText(MainActivity.this, content, Toast.LENGTH_SHORT)
                                    .show();
                            result.success("success");
                        } else {
                            result.error("-1", "toast fail", "content is null");
                        }
                        break;
                    default:
                        result.notImplemented();
                }
            }
        });
    }

    private void methodChannelSender() {
        Map map = new HashMap();
        map.put("content", String.valueOf(mNumber));
        mMethodChannel.invokeMethod("increase", map, new MethodChannel.Result() {

            @Override
            public void success(Object o) {
                System.out.println("success");
            }

            @Override
            public void error(String s, String s1, Object o) {
                System.out.println("error");
            }

            @Override
            public void notImplemented() {
                System.out.println("notImplemented");
            }
        });
    }
}
