import SwiftUI

struct AutomationView: View {

    // MARK: - Example automation parameters
    @State private var ccValue: Double = 64
    @State private var programChange: Int = 0
    @State private var isRecording: Bool = false

    var body: some View {
        VStack(spacing: 20) {

            // Header
            Text("MIDI Automation Panel")
                .font(.largeTitle)
                .bold()

            // CC Slider
            VStack {
                Text("Control Change (CC7): \(Int(ccValue))")
                Slider(value: $ccValue, in: 0...127, step: 1)
                    .accentColor(.blue)
            }
            .padding()

            // Program Change Picker
            VStack {
                Text("Program Change: \(programChange)")
                Picker(selection: $programChange, label: Text("Program")) {
                    ForEach(0..<128) { num in
                        Text("Program \(num)").tag(num)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 100)
            }
            .padding()

            // Record Toggle
            Toggle(isOn: $isRecording) {
                Text(isRecording ? "Recording Enabled" : "Recording Disabled")
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}

struct AutomationView_Previews: PreviewProvider {
    static var previews: some View {
        AutomationView()
    }
}
