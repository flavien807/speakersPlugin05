export interface SpeakerPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
