import SwiftUI

struct MainScreen: View {
    @State private var forms: [String] = []

    var body: some View {
        HStack{
            Rectangle()
                .background(.tint)
                .foregroundColor(.blue)
                .frame(height: 80)
        }
        ScrollView(.horizontal) {
            LazyHStack() {
                ForEach(forms.indices, id: \.self) { index in
                    scheda(index: index, formName: forms[index], forms: $forms)
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

    func addForm() {
        let newFormName = "Scheda \(forms.count + 1)"
        forms.append(newFormName)
        print("Added form: \(newFormName)")
    }
}

struct scheda: View {
    var index: Int
    var formName: String
    @Binding var forms: [String]

    var body: some View {
        Button(action: {
            print("Scheda \(index + 1) has been tapped")
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.blue, lineWidth: 2)
                    .frame(width: 150, height: 150)
                VStack {
                    Text("\(formName)")
                        .font(.headline)
                }
            }
        }
    }
}

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

#Preview {
    MainScreen()
}
