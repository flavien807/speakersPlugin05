import { WebPlugin } from '@capacitor/core';

import type { SpeakerPluginPlugin } from './definitions';

export class SpeakerPluginWeb extends WebPlugin implements SpeakerPluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
