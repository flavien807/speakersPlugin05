import { registerPlugin } from '@capacitor/core';

import type { SpeakerPluginPlugin } from './definitions';

const SpeakerPlugin = registerPlugin<SpeakerPluginPlugin>('SpeakerPlugin', {
  web: () => import('./web').then((m) => new m.SpeakerPluginWeb()),
});

export * from './definitions';
export { SpeakerPlugin };
