import Foundation

/// AutomationManager
/// Records and plays back MIDI automation events over time
final class AutomationManager {

    // MARK: - Properties
    private(set) var events: [AutomationEvent] = []
    private var recordingStartTime: Date?

    // MARK: - Recording
    func startRecording() {
        events.removeAll()
        recordingStartTime = Date()
    }

    func stopRecording() {
        recordingStartTime = nil
    }

    func record(event: AutomationEvent) {
        guard let start = recordingStartTime else { return }
        let timestamp = Date().timeIntervalSince(start)
        var newEvent = event
        newEvent.timestamp = timestamp
        events.append(newEvent)
    }

    // MARK: - Playback
    /// Plays back recorded events, calling the provided send closure for each
    func playback(send: @escaping (_ event: AutomationEvent) -> Void) {
        guard !events.isEmpty else { return }

        let startTime = Date()
        for event in events {
            let delay = event.timestamp - Date().timeIntervalSince(startTime)
            guard delay >= 0 else { continue }
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                send(event)
            }
        }
    }

    // MARK: - Utilities
    func clear() {
        events.removeAll()
    }
}
