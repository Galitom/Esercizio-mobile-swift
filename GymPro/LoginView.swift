import SwiftUI

struct LoginView: View {
    @State var userValue = UserData(nome: "", cognome: "")
    
    var body: some View {
        VStack{
            Image("Gym")
            MyTextField(withIcon: "person.fill", textValue: $userValue.nome, textHint: "Nome")
            MyTextField(withIcon: "person.fill", textValue: $userValue.cognome, textHint: "Cognome")
            MyTextField(withIcon: "person.fill", textValue: $userValue.email, isMandatory: true, textHint: "email")
            MyTextField(withIcon: "key.fill", textValue: $userValue.email, isMandatory: true, isSecret: true, textHint: "email")
            
            HStack(spacing: 50){
                Button("Login"){
                }.foregroundColor(.purple)
                    .disabled(userValue.isAllMandatoryFiledsEmpty)
                Button("Pulisci"){
                    userValue.emptyFields()
                }.foregroundColor(.green)
                    .disabled(userValue.isAnyMandatoryFiledsEmpty)
            }
            
        }
    }
    
}

struct UserData {
   
    @State var email: String = ""
    @State var password: String = ""
    @State var nome: String = ""
    @State var cognome : String = ""
    @State var eta : Int = 0
    
    var isAllMandatoryFiledsEmpty : Bool {
        return email.isEmpty || password.isEmpty
    }
    
    var isAnyMandatoryFiledsEmpty : Bool {
        return email.isEmpty && password.isEmpty
    }
    
    mutating func emptyFields(){
        nome = ""
        cognome = ""
    }
}

struct MyTextField : View {
    @State var withIcon : String
    @Binding var textValue : String
    @State var isMandatory : Bool = false
    @State var isSecret : Bool = false
    @State var textHint : String
    
    var body: some View {
        HStack {
            Image ( systemName: withIcon)
            if(isSecret) {
                SecureField(textHint, text: $textValue)
            }else{
                TextField(textHint, text: $textValue)
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 8)
            .stroke(isMandatory && textValue.isEmpty ? .red : .gray, lineWidth: 1))
        padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

