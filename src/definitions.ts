export interface SpeakerPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  setAudioMode(options: { mode: 'speaker' | 'earpiece' }): Promise<{ success: boolean }>;
}
