import SwiftUI
import CoreData

struct ContentView: View {
	//Scheda Principale
	var body: some View {
		NavigationStack {
			List{
				carousel()
				Rectangle()
					.frame(width: 250, height: 250)
				Rectangle()
					.frame(width: 250, height: 250)
				
			}
			.navigationTitle("Home")
			.toolbar{
				NavigationLink(destination: AccountScreen()) {
					Image(systemName: "person.crop.circle.fill")
						.font(.system(size: 35))
						.symbolRenderingMode(.hierarchical)
						.accentColor(Color(red: 201/255, green: 201/255, blue: 201/255, opacity: 1))
						.foregroundColor(.white)
						//.padding([.bottom], 5)
				}
			}
			.toolbarColorScheme(.dark, for: .navigationBar)
			.toolbarBackground(Color.blue, for: .navigationBar)
			.toolbarBackground(.visible, for: .navigationBar)
		}
	}
}

//Struttura quadrato schede
struct scheda: View {
	@State private var isVisible = false
	var index: Int
	var formName: String
	@Binding var forms: [String]
	var removeForm: (Int) -> Void

	var body: some View {
		Button(action: {
			print("Scheda \(formName) has been tapped")
		}) {
			ZStack {
				RoundedRectangle(cornerRadius: 25)
					.stroke(.blue, lineWidth: 2)
					.frame(width: 150, height: 150)
				
				VStack {
					Text("\(formName)")
						.font(.headline)
					
					if(isVisible){
						Spacer()
							.frame(height: 7.0)
						
						Button(action: {
							removeForm(index)
						}) {
							Image(systemName: "trash")
								.foregroundColor(.red)
								.frame(alignment: .bottom)
						}
					}
					
				}
				.simultaneousGesture(
					LongPressGesture(minimumDuration: 0.3)
						.onEnded { _ in
							isVisible.toggle()
						}
				)
			}
		}
	}
}


struct carousel: View{
	@State private var forms: [String] = []
	//@State private var menuVisible = false
	
	func addForm() {
		let newFormName = "Scheda \(forms.count + 1)"
		forms.append(newFormName)
		print("Added form: \(newFormName)")
	}
	
	func removeForm(at index: Int) {
		if forms.indices.contains(index) {
			forms.remove(at: index)
		}
	}
	
	func renameForm(){
		
	}
	var body: some View{
		ScrollView(.horizontal) {
			LazyHStack() {
				ForEach(forms.indices, id: \.self) { index in
					scheda(index: index, formName: forms[index], forms: $forms, removeForm: removeForm)
				}
				defaultButtonCarousel(addForm: addForm)
			}
			.padding([.horizontal], 25)
		}
	}
}

//Struttura Aggiungi Scheda
struct defaultButtonCarousel: View {
	var addForm: () -> Void

	var body: some View {
		Button(action: {
			addForm()
		}) {
			ZStack {
				RoundedRectangle(cornerRadius: 25)
					.stroke(.blue, lineWidth: 2)
					.frame(width: 150, height: 150)
				VStack {
					Image(systemName: "plus")
						.font(.title)
						.padding([.vertical], 5)
					Text("Aggiungi Scheda")
						.font(.headline)
				}
			}
		}
	}
}

/*struct menuAccount: View{
	var body: some View{
		HStack{
			Spacer()
			ZStack{
				Rectangle()
					.foregroundColor(.orange)
					.animation(Animation.easeInOut(duration: 2.0), value: 100.0)
					.frame(maxWidth: 200, maxHeight: 620, alignment: .bottom)
				
				VStack{
					Text("Account")
						.padding(.top, 20)
					Text("Impostazioni")
						.padding(.top, 20)
					Rectangle()
						.foregroundColor(.clear)
						.frame(width: 200, height: 500)
				}
			}
		}
	}
}*/

struct navigationBar: View{
	var body: some View{
		NavigationStack {
				Text("Corpo")
			}
			.navigationTitle("Home")
			.toolbar{
				VStack{
					Rectangle()
						.frame(height: 65)
						.foregroundColor(.clear)
					NavigationLink(destination: AccountScreen()) {
						Image(systemName: "person.crop.circle.fill")
							.font(.system(size: 40))
							.symbolRenderingMode(.hierarchical)
							.accentColor(Color(red: 201/255, green: 201/255, blue: 201/255, opacity: 1))
							
					}
				}
			}
			.toolbarColorScheme(.dark, for: .navigationBar)
			.toolbarBackground(Color.blue, for: .navigationBar)
			.toolbarBackground(.visible, for: .navigationBar)
		}
	}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
