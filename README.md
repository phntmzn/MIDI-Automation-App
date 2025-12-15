

# MIDI Automation App

A **Swift-based MIDI automation system** for recording, saving, and replaying MIDI events with precise timing.
Designed for **live performance, studio workflows, and testing MIDI setups**.

---

## Features

- 🎹 Record MIDI note, CC, program change, and pitch bend events
- ⏱ Timestamped automation events for precise playback
- 💾 Codable event storage for persistence
- 📊 SwiftUI automation panel for controlling CC and program changes
- 🔄 Playback automation sequences through CoreMIDI
- 🧩 Decoupled architecture: input, capture, model, routing, and output separated

---

## Project Structure

```
MIDI Automation App/
├── Models/
│   └── AutomationEvent.swift      # MIDI automation event model
├── MIDI/
│   ├── AutomationManager.swift    # Recording & playback engine
│   └── (receiver, sender, router logic)
├── Views/
│   └── AutomationView.swift       # SwiftUI interface
├── README.md
└── MIDIAutomationApp.xcodeproj
```

---

## Usage

### 1. Record Automation

```swift
let manager = AutomationManager()
manager.startRecording()

// on incoming MIDI events:
manager.record(event: AutomationEvent(timestamp: 0, channel: 0, type: .controlChange(cc: 7, value: 100)))
Record, recall, and automate your MIDI environment efficiently.
