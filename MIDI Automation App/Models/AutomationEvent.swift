import Foundation

/// AutomationEvent
/// Represents a single MIDI automation event captured over time
struct AutomationEvent: Identifiable, Codable, Hashable {

    let id: UUID
    var timestamp: TimeInterval  // Seconds since start of recording
    var channel: UInt8            // MIDI channel 0–15
    var type: EventType

    enum EventType: Codable, Hashable {
        case noteOn(note: UInt8, velocity: UInt8)
        case noteOff(note: UInt8)
        case controlChange(cc: UInt8, value: UInt8)
        case programChange(program: UInt8)
        case pitchBend(value: Int)  // -8192 to 8191
    }

    init(timestamp: TimeInterval, channel: UInt8, type: EventType) {
        self.id = UUID()
        self.timestamp = timestamp
        self.channel = channel & 0x0F
        self.type = type
    }
}
