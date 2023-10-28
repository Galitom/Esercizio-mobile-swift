import SwiftUI

struct SchedaView: View {
	@State private var selectedExercises: [Exercise] = []
	@Binding var formName: String
	
    var body: some View {
		NavigationStack{

			List{

			}
		}
		.navigationTitle("\(formName)")
		.toolbar{
			NavigationLink(destination: ExerciseSelectionView(selectedExercises: $selectedExercises)) {
				Spacer()
				Image(systemName: "plus")
					.font(.system(size: 25))
					.offset(x: 0, y: 10)
				}
		}
		//.scrollContentBackground(.hidden)
    }
}

struct Exercise: Identifiable {
	let id = UUID()
	let name: String
}

struct SchedaView_Previews: PreviewProvider {
    static var previews: some View {
		SchedaView(formName: .constant("Sample Form Name"))
    }
}
