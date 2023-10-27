import SwiftUI

struct AccountScreen: View {
	@State private var name: String = ""
	@AppStorage ("Name_Key") private var savedName: String = ""
	@State private var surname: String = ""
	@AppStorage ("Surname_Key") private var savedSurname: String = ""
	@State private var email: String = ""
	@AppStorage ("Email_Key") private var savedEmail: String = ""
	@State private var birthDate = Date()
	@AppStorage ("Date_Key") private var savedDate: String = ""
	@State private var password: String = ""
	@AppStorage ("Password_Key") private var savedPassword: String = ""
	@State private var showPassword: Bool = false
	@Environment(\.editMode) private var editMode
	@State private var profileImage: Image?
	
	var body: some View {
		NavigationStack{
			List{
				EditButton()
					.position(x: 310, y:10)
				
				if(editMode?.wrappedValue.isEditing == true){
					
					Image(systemName: "person.crop.circle.fill")
						.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
						.font(.system(size: 100))
						.padding([.bottom])
						.listRowSeparator(.hidden)
						.listRowInsets(.init(top: 0, leading: 200, bottom: 0, trailing: 200))
					
					TextField("First Name",text: $name)
						.frame(alignment: .centerLastTextBaseline)
					
					TextField("Second Name",text: $surname)
						.frame(alignment: .centerLastTextBaseline)
					
					TextField("Email",text: $email)
						.autocapitalization(.none)
						.autocorrectionDisabled(true)
						.frame(alignment: .centerLastTextBaseline)
					
					DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
						Text("Select date of birth")
					}
					
					//button SeePassword
					if(!showPassword){
						HStack{
							SecureField("Password",text: $password)
								.autocapitalization(.none)
								.autocorrectionDisabled(true)
								.frame(alignment: .centerLastTextBaseline)
							Button {
								showPassword.toggle()
							}
							label: {
								Image(systemName: showPassword ? "eye.slash" : "eye")
									.foregroundColor(.blue)
							}
						}
					}
					
					else{
						HStack{
							TextField("Password",text: $password)
								.autocapitalization(.none)
								.autocorrectionDisabled(true)
								.frame(alignment: .centerLastTextBaseline)
							Button {
								showPassword.toggle()
							}
							label: {
								Image(systemName: showPassword ? "eye.slash" : "eye")
									.foregroundColor(.blue)
							}
						}
					}
				}
				
				else{
					Image(systemName: "person.crop.circle.fill")
						.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
						.font(.system(size: 100))
						.padding([.bottom])
						.listRowSeparator(.hidden)
						.listRowInsets(.init(top: 0, leading: 200, bottom: 0, trailing: 200))
					
					TextField("First Name", text: $name)
						.frame(alignment: .centerLastTextBaseline)
						.disabled(true)
						.foregroundColor(.gray)
						.onAppear{
							self.name = savedName
						}
						.listRowSeparator(.hidden)
					
					
					TextField("Second Name", text: $surname)
						.frame(alignment: .centerLastTextBaseline)
						.disabled(true)
						.foregroundColor(.gray)
						.onAppear{
							self.surname = savedSurname
						}
						.listRowSeparator(.hidden)
					
					TextField("Email", text: $email)
						.frame(alignment: .centerLastTextBaseline)
						.disabled(true)
						.foregroundColor(.gray)
						.onAppear{
							self.email = savedEmail
						}
						.listRowSeparator(.hidden)
					
					DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
						Text("Date of birth")
							.foregroundColor(.gray)
					}
					.listRowSeparator(.hidden)
					.foregroundColor(.gray)
					.onAppear{
						let dateFormatter = DateFormatter()
						dateFormatter.dateStyle = .short
						if let date = dateFormatter.date(from: savedDate) {
							birthDate = date
							print("Stored Data \(birthDate)")
						}
					}
					.disabled(true)
					
					if(!showPassword){
						HStack{
							SecureField("Password",text: $password)
								.frame(alignment: .centerLastTextBaseline)
								.disabled(true)
								.onAppear{
									self.password = savedPassword
								}
								.listRowSeparator(.hidden)
							
							//button SeePassword
							Button {
								showPassword.toggle()
							}
							label: {
								Image(systemName: showPassword ? "eye.slash" : "eye")
									.foregroundColor(.blue)
							}
						}
					}
					
					else{
						HStack{
							TextField("Password",text: $password)
								.frame(alignment: .centerLastTextBaseline)
								.disabled(true)
								.foregroundColor(.gray)
								.onAppear{
									self.password = savedPassword
								}
								.listRowSeparator(.hidden)
							//button SeePassword
							Button {
								showPassword.toggle()
							}
							label: {
								Image(systemName: showPassword ? "eye.slash" : "eye")
									.foregroundColor(.blue)
							}
						}
					}
				}
			}
			.navigationTitle("Account")
			.scrollContentBackground(.hidden)
			
			if(editMode?.wrappedValue.isEditing == true){
				HStack{
					Button(action: {
						print("Save Button Tapped")
						self.savedName = name
						self.savedSurname = surname
						self.savedEmail = email
						self.savedDate = dateFormatString(birthDate)
						print(savedDate)
						self.savedPassword = password
						
					})
					{
						Text("Save")
							.font(.system(size: 20))
							.padding([.vertical], 10)
							.padding([.horizontal], 30)
							.foregroundColor(.white)
					}
					.background(.blue)
					.cornerRadius(20)
					.padding([.vertical], 40)
					//.padding([.horizontal], 150)
					
				}
			}
		}
	}
	
	func dateFormatString(_ date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .short
		return dateFormatter.string(from: date)
	}
}


struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
