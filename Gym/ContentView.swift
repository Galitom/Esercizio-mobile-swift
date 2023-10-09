import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(){
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.blue, lineWidth: 5)
                        .frame(width: 150, height: 150)
                        .tag(0)
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.blue, lineWidth: 5)
                        .frame(width: 150, height: 150)
                        .tag(1)
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.blue, lineWidth: 5)
                        .frame(width: 150, height: 150)
                        .tag(2)
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.blue, lineWidth: 5)
                        .frame(width: 150, height: 150)
                        .tag(3)
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.blue, lineWidth: 5)
                        .frame(width: 150, height: 150)
                        .tag(4)
            }
            .padding([.horizontal])
        }
        .scrollTargetBehavior(.paging)
        HStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(.blue)
                .frame(width: 200, height: 200)
                
        }
        
        HStack{
            RoundedRectangle(cornerRadius:25)
                .fill(.blue)
                .frame(width: 200, height: 200)
                .padding([.top])
        }
    }
}

#Preview {
    ContentView()
        
}

