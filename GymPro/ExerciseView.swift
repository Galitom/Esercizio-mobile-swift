import SwiftUI

struct ExerciseSelectionView: View {
	@Binding var selectedExercises: [Exercise]
	
	let allExercises: [Exercise] = [
		Exercise(name: "Running"),
		Exercise(name: "Squats"),
		Exercise(name: "Push-ups"),
		Exercise(name: "Planks"),
		// Add more exercises to the list
	]

	var body: some View {
		List {
			ForEach(allExercises) { exercise in
				Button(action: {
					if selectedExercises.isEmpty {
						selectedExercises.append(exercise)
					}
				}) {
					HStack {
						Text(exercise.name)
						Spacer()
						if !selectedExercises.isEmpty {
							Image(systemName: "checkmark")
						}
					}
				}
			}
		}
		.navigationTitle("All Exercise")
	}
}


struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
		ExerciseSelectionView(selectedExercises: .constant([]))
    }
}
