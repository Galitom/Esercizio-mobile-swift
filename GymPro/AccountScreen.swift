import SwiftUI

struct AccountScreen: View {
	@State private var date = Date()
	var body: some View {
		NavigationStack{
			Image(systemName: "person.crop.circle.fill")
				.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
				.font(.system(size: 100))
				.padding([.bottom])
			Text("Name")
				.padding([.bottom], 5)
			Text("Surname")
				.padding([.bottom], 5)
			Text("Email")
				.padding([.bottom], 5)
			Text("Age")
				.padding([.bottom], 5)
			
			
		}
		.navigationTitle("Account")
		.toolbar{
			
		}
		//Rectangle()
	}
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
