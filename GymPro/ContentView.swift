import SwiftUI
import CoreData

struct ContentView: View {
	@State var isVisible: Bool = false
	@State var isLoggedIn: Bool = false
	@State var isRegistered: Bool = true
	//Scheda Principale
	var body: some View {
		if(isLoggedIn && isRegistered){
			NavigationStack {
				List{
					carousel()
						.listRowSeparator(.hidden)
						.listRowInsets(.init(top: 35, leading: 0, bottom: 0, trailing: 0))
					Rectangle()
						.frame(width: 250, height: 250)
						.listRowSeparator(.hidden)
						.listRowInsets(.init(top: 35, leading: 100, bottom: 0, trailing: 100))
						.cornerRadius(50)
						.foregroundColor(.blue)
					
					Rectangle()
						.frame(width: 250, height: 250)
						.listRowSeparator(.hidden)
						.listRowInsets(.init(top: 35, leading: 100, bottom: 0, trailing: 100))
						.cornerRadius(50)
						.foregroundColor(.blue)
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
				//.padding([.top], 20)
				.scrollContentBackground(.hidden)
				
				/*.onTapGesture {
				 if(isVisible == true){
				 isVisible.toggle()
				 }
				 }*/
			}
		}
		else if(isRegistered){
			LoginView(isLoggedIn: $isLoggedIn, isRegistered: $isRegistered)
		}
		else{
			RegisterView(isLoggedIn: $isLoggedIn, isRegistered: $isRegistered)
		}
	}
}

//Struttura quadrato schede
struct scheda: View {
	@State private var isVisible: Bool = false
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
					.padding([.leading], 1)
				
				VStack {
					Text("\(formName)")
						.font(.callout)
						.multilineTextAlignment(.center)
						
					
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

			}
		}
		.simultaneousGesture(
			LongPressGesture(minimumDuration: 0.3)
				.onEnded { _ in
					isVisible = true

				}
		)
		
	}
}


struct carousel: View{
	@State private var forms: [String] = []
	
	
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
			.padding([.vertical],1)
		}
		//.padding([.horizontal], 10)
	}
}

struct RowView: View {
	
	@State var longPress = false
	var body: some View {
		Button(action: {
			if (self.longPress) {
				self.longPress.toggle()
			} else {
				// Normal button code here
			}
		}) {
			// Buttons LaF here
		}
		// RowView code here.
		.simultaneousGesture(LongPressGesture(minimumDuration: 0.5)
			.onEnded { _ in
				self.longPress = true
		})
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
					.padding([.leading], 1)
				VStack {
					Image(systemName: "plus")
						.aspectRatio(contentMode: .fit)
						.font(.largeTitle)
						.padding([.vertical], 5)
					Text("Aggiungi Scheda")
						.font(.callout)
						.fontWeight(.regular)
						
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
