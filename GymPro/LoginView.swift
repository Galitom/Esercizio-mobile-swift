import SwiftUI

struct LoginView: View {
	@State var userValue = UserData(nome: "", cognome: "")
	@Binding var isLoggedIn: Bool
	@Binding var isRegistered: Bool
	
	var body: some View {
		VStack{
			Image("Gym")
			MyTextFieldLogin(withIcon: "envelope.fill", textValue: $userValue.email, isMandatory: true, textHint: "Email", isEmail: true)
				.autocapitalization(.none)
				.autocorrectionDisabled(true)

			MyTextFieldLogin(withIcon: "key.fill", textValue: $userValue.password, isMandatory: true, isSecret: true, textHint: "Password")
				.padding(.bottom, 50)
			
			HStack(spacing: 75){
				/*
				Button("Pulisci"){
					userValue.emptyFields()
				}
				.foregroundColor(.green)
				.disabled(userValue.isAnyMandatoryFiledsEmpty)
				
				Button("Login"){
				}
				.foregroundColor(.purple)
				.disabled(userValue.isAllMandatoryFiledsEmpty)
				.background(Color.blue)
				.cornerRadius(25)
				*/
				Button(action: {
					print("Sign Up")
					isRegistered = false
				}) {
					Text("Sign Up")
					  .frame(minWidth: 80)
					  .font(.system(size: 20))
					  .padding([.vertical], 10)
					  .padding([.horizontal], 15)
					  .foregroundColor(.white)
				 }
				.disabled(userValue.isAllMandatoryFiledsEmpty)
				.background(Color.gray)
				.cornerRadius(20)
				
				Button(action: {
					print("Login")
					isLoggedIn = true
				}) {
					Text("Login")
						.frame(minWidth: 80)
						.font(.system(size: 20))
						.padding([.vertical], 10)
						.padding([.horizontal], 15)
						.foregroundColor(.white)
				}
				.disabled(userValue.isAllMandatoryFiledsEmpty)
				.background(Color.blue)
				.cornerRadius(20)
				
			}
		}
	}
}

struct UserDataLogin {
   
	var email: String = ""
	var password: String = ""
	
	var isAllMandatoryFiledsEmpty : Bool {
		return email.isEmpty || password.isEmpty
	}
	
	var isAnyMandatoryFiledsEmpty : Bool {
		return email.isEmpty && password.isEmpty
	}
}

struct MyTextFieldLogin : View {
	var withIcon : String
	@Binding var textValue : String
	var isMandatory : Bool = false
	var isSecret : Bool = false
	var textHint : String
	var isEmail : Bool = false
	@State var showPassword: Bool = false
	
	var body: some View {
		HStack {
			Image (systemName: withIcon)
			if(isSecret && !showPassword) {
				SecureField(textHint, text: $textValue)
				Button {
					showPassword.toggle()
				}
				label: {
					Image(systemName: showPassword ? "eye.slash" : "eye")
						.foregroundColor(.blue)
				}
			}
			
			else if(isSecret && showPassword && !isEmail){
				TextField(textHint, text: $textValue)
				Button {
					showPassword.toggle()
				}
				label: {
					Image(systemName: showPassword ? "eye.slash" : "eye")
						.foregroundColor(.blue)
				}
			}
			
			else{
				TextField(textHint, text: $textValue)
			}

		}
		.padding()
		.overlay(RoundedRectangle(cornerRadius: 8)
			.stroke(isMandatory && textValue.isEmpty || isEmail && (!textValue.contains("@") || !textValue.contains(".")) ? .red : .gray, lineWidth: 1))
		.padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
	}
	
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView(isLoggedIn: .constant(false), isRegistered: .constant(true))
	}
}

