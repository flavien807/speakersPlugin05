import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(SpeakerPluginPlugin)
public class SpeakerPluginPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "SpeakerPluginPlugin"
    public let jsName = "SpeakerPlugin"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = SpeakerPlugin()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func setAudioMode(_ call: CAPPluginCall) {
        guard let mode = call.getString("mode")?.lowercased() else {
            call.reject("Mode est nul")
            return
        }

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .voiceChat, options: [])

            switch mode {
            case "speaker":
                try audioSession.overrideOutputAudioPort(.speaker)
                CAPLog.print("Speaker mode activated")
            case "earpiece":
                try audioSession.overrideOutputAudioPort(.none)
                CAPLog.print("Earpiece mode activated")
            default:
                call.reject("Le mode doit être 'speaker' ou 'earpiece'")
                return
            }

            try audioSession.setActive(true)
            call.resolve([
                "success": true
            ])
        } catch {
            call.reject("Erreur lors de la configuration du mode audio: \(error.localizedDescription)")
        }
    }
}
