import { WebPlugin } from '@capacitor/core';

import type { SpeakerPluginPlugin } from './definitions';

export class SpeakerPluginWeb extends WebPlugin implements SpeakerPluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async setAudioMode(options: { mode: 'speaker' | 'earpiece' }): Promise<{ success: boolean }> {
    console.log(`setAudioMode called with mode: ${options.mode}`);
    return { success: true };
  }
}
