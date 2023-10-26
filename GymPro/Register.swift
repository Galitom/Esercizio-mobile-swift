import SwiftUI

struct UserData {
    var email = ""
    var password = ""
    var nome: String = ""
    var cognome : String = ""
    var eta : Int = 0
    
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
    var withIcon : String
    @Binding var textValue : String
    var isMandatory : Bool = false
    var isSecret : Bool = false
    var textHint : String
    
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

struct RegisterView: View {
    @State var userValue = UserData(nome: "", cognome: "")
    
    var body: some View {
        VStack{
            Image("Gym")
            MyTextField(withIcon: "person.fill", textValue: $userValue.nome, textHint: "Nome")
            MyTextField(withIcon: "person.fill", textValue: $userValue.cognome, textHint: "Cognome")
            MyTextField(withIcon: "person.fill", textValue: $userValue.email, isMandatory: true, textHint: "email")
            MyTextField(withIcon: "key.fill", textValue: $userValue.email, isMandatory: true, isSecret: true, textHint: "email")
            
            HStack(spacing: 50){
                Button("Registrati"){
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
