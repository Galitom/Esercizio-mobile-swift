import SwiftUI

struct AccountScreen: View {
	@State private var birthDate = Date()
	@State private var name: String = ""
	@State private var surname: String = ""
	@State private var email: String = ""
	
	var body: some View {
		NavigationStack{
			List{
				EditButton()
					.position(x: 310, y:10)
				/*
				Image(systemName: "square.and.pencil")
					.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
					.font(.title)
					.listRowInsets(.init(top: 0, leading: 320, bottom: 50, trailing: 0))
				 */
				Image(systemName: "person.crop.circle.fill")
					.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
					.font(.system(size: 100))
					.padding([.bottom])
					.listRowSeparator(.hidden)
					.listRowInsets(.init(top: 0, leading: 200, bottom: 0, trailing: 200))
				/*HStack{
					Text("Name")
						.padding([.bottom], 5)
						
					TextField(
						"First Name",
						text: $name
					)
					.multilineTextAlignment(.trailing)
				}*/
				TextField(
					"First Name",
					text: $name
				)
				.frame(alignment: .centerLastTextBaseline)
				TextField(
					"Second Name",
					text: $surname
				)
				.frame(alignment: .centerLastTextBaseline)
				TextField(
					"Email",
					text: $email
				)
				.autocapitalization(.none)
				.autocorrectionDisabled(true)
				.frame(alignment: .centerLastTextBaseline)
				
				DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
					Text("Select a date")
				}
				
			}
			.navigationTitle("Account")
			.scrollContentBackground(.hidden)
		}
		//Rectangle()
	}
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
