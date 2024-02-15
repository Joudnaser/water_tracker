import SwiftUI

struct WaterTrackerView: View {
    // Replace these with your actual data and methods
    @State private var currentIntake: Double = 0.0
    @State private var intakeGoal: Double = 2.7
    @State private var progress: Double = 0.0

    var body: some View {
        NavigationView {
            VStack {
                Text("Today's Water Intake")
                    .font(.title)
                    .padding(.top)

                // Water intake progress display
                ZStack {
                    Circle()
                        .stroke(lineWidth: 36)
                        .opacity(0.3)
                        .foregroundColor(Color.blue)

                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 36, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.blue)
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear, value: progress)
                    Text(String(format: "%.1f liter / %.1f liter", currentIntake, intakeGoal))
                        .font(.title2)
                        .padding(.all, 25.0)
                }
                .padding(.all, 20.0)

                HStack {
                    Button(action: {
                        // Decrement action
                        self.changeWaterIntake(by: -0.1)
                    }) {
                        Image(systemName: "minus")
                            .font(.title)
                    }
                    .buttonStyle(PlainButtonStyle())

                    Spacer()

                    Text("\(String(format: "%.1f", currentIntake))")
                        .font(.title)

                    Spacer()

                    Button(action: {
                        // Increment action
                        self.changeWaterIntake(by: 0.1)
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 40.0)

                Spacer()

                Text("Swipe right for cups calculating")
                    .gesture(DragGesture(minimumDistance: 100)
                        .onEnded({ _ in
                            // Navigate to cup calculations
                        }))
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "gear"))
            .padding()
        }
    }

    func changeWaterIntake(by amount: Double) {
        // Add validation to ensure currentIntake does not go below 0 or above intakeGoal
        currentIntake += amount
        currentIntake = min(max(currentIntake, 0), intakeGoal)
        progress = currentIntake / intakeGoal
    }
}

struct WaterTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerView()
    }
}
