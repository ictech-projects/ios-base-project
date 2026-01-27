import SwiftUI

struct OverlayCircularProgressView: View {
	
	let show: Bool
	
	var body: some View {
		Group {
			if show {
				Color.black.opacity(0.5)
					.ignoresSafeArea()
				
				ProgressView()
					.progressViewStyle(.circular)
					.tint(.white)
			}
		}
	}
}

#Preview {
	ZStack {
		Color.blue.ignoresSafeArea(edges: .all)
		Text("Some background")
			.font(.title)
		OverlayCircularProgressView(show: true)
	}
}
