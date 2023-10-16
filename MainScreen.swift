import SwiftUI

struct MainScreen: View {
	@State private var forms: [String] = []
	@State private var menuVisible = false
	
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
	
	//Scheda Principale
	var body: some View {
		//Schermata applicazione divisa in livelli per sovrapposizione menu
		ZStack{
			//Disposizione verticale degli oggetti della schermata
			VStack{
				//sovrapposizione della barra in alto con pulsante button
				ZStack{
					Rectangle()
						.background(.tint)
						.foregroundColor(.blue)
						.frame(height: 70)
					HStack{
						Spacer()
						Button(action: {
							menuVisible.toggle()
							print("menu is open: \(menuVisible)")
						}) {
							/*HStack{
								Image(systemName: "person.crop.circle.fill")
									.font(.system(size: 45))
								//.symbolRenderingMode(.hierarchical)
									.accentColor(Color(red: 201/255, green: 201/255, blue: 201/255, opacity: 1))
								*/
														
							 HStack{
								 Image(systemName: "gear")
									 .font(.system(size: 35))
								 //.symbolRenderingMode(.hierarchical)
									 .accentColor(Color(red: 201/255, green: 201/255, blue: 201/255, opacity: 1))
							}
							//.background(Color.red.opacity(0.3))
						}
					}
					.padding([.horizontal],25)
				}
				
				//Carosello Schede
				ScrollView(.horizontal) {
					LazyHStack() {
						ForEach(forms.indices, id: \.self) { index in
							scheda(index: index, formName: forms[index], forms: $forms, removeForm: removeForm)
						}
						defaultButtonCarousel(addForm: addForm)
					}
					.padding([.horizontal], 25)
				}
				.scrollTargetBehavior(.paging)
					
				HStack {
					RoundedRectangle(cornerRadius: 25)
						.fill(.blue)
						.frame(width: 200, height: 200)
				}
					
				HStack {
					RoundedRectangle(cornerRadius: 25)
						.fill(.blue)
						.frame(width: 200, height: 200)
						.padding([.top])
					}
				}
				
				if (menuVisible){
					menuAccount()
				}
			}
		}
	}

//Struttura quadrato schede
struct scheda: View {
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

struct menuAccount: View{
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
}

#Preview {
    MainScreen()
}
