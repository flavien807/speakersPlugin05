package com.flav;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import android.content.Context;
import android.media.AudioManager;
import android.util.Log;


@CapacitorPlugin(name = "SpeakerPlugin")
public class SpeakerPluginPlugin extends Plugin {

    private SpeakerPlugin implementation = new SpeakerPlugin();
    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void setAudioMode(PluginCall call) {
      String mode = call.getString("mode");

      if (mode == null) {
        call.reject("Mode is null");
        return;
      }

      AudioManager audioManager = (AudioManager) getContext().getSystemService(Context.AUDIO_SERVICE);

      if (audioManager == null) {
        call.reject("AudioManager not available");
        return;
      }

      boolean success = false;

      switch (mode.toLowerCase()) {
        case "speaker":
          audioManager.setMode(AudioManager.MODE_IN_COMMUNICATION);
          audioManager.setSpeakerphoneOn(true);

          int maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_VOICE_CALL);
          audioManager.setStreamVolume(AudioManager.STREAM_VOICE_CALL, maxVolume, 0);

          success = true;
          Log.d("SpeakerPlugin", "Mode set to Speaker");
          break;
        case "earpiece":
          audioManager.setSpeakerphoneOn(false);
          audioManager.setMode(AudioManager.MODE_IN_COMMUNICATION);

          int maxVolumes = audioManager.getStreamMaxVolume(AudioManager.STREAM_VOICE_CALL);
          audioManager.setStreamVolume(AudioManager.STREAM_VOICE_CALL, maxVolumes, 0);

          success = true;
          Log.d("SpeakerPlugin", "Mode set to Earpiece");
          break;
        default:
          call.reject("Mode must be 'speaker' or 'earpiece'");
          return;
      }

      JSObject ret = new JSObject();
      ret.put("success", success);
      call.resolve(ret);
    }
}
