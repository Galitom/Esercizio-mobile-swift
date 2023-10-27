import SwiftUI

struct SplashView: View {
	
	@State var isActive: Bool = false
	
	var body: some View {
		ZStack {
			if self.isActive {
				ContentView()
			} else {
				Rectangle()
					.background(Color.blue)
					.foregroundColor(.blue)
				
				Image("logo")
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
					.overlay(RoundedRectangle(cornerRadius: 10)
						.stroke(Color.clear, lineWidth: 4))
					
			}
		}
		
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
				withAnimation {
					self.isActive = true
				}
			}
		}
	}
}

struct SplashView_Previews: PreviewProvider {
	static var previews: some View {
		SplashView()
	}
}
