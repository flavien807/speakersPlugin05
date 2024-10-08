package com.flav;

import android.util.Log;

public class SpeakerPlugin {

    public String echo(String value) {
        Log.i("Echo", value);
        return value;
    }
}
