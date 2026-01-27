import SwiftUI

struct ImageLoader: View {
	let path: String
	let width: CGFloat
	let height: CGFloat
	
	init(path: String, width: CGFloat = .infinity, height: CGFloat = .infinity) {
		self.path = path
		self.width = width
		self.height = height
	}
	
	var body: some View {
		AsyncImage(
			url: URL(string: path),
			transaction: Transaction(animation: .default)
		) { phase in
			switch phase {
			case .empty:
				Color.gray
					.overlay(
						ProgressView()
							.progressViewStyle(.circular)
							.tint(.white)
					)
					.frame(width: width, height: height)
			case .success(let image):
				image
					.resizable()
					.scaledToFill()
					.frame(width: width, height: height)
					
			case .failure:
				Color.gray
					.overlay(
						Image(systemName: "exclamationmark.circle")
							.resizable()
							.scaledToFit()
							.frame(width: width/3)
							.foregroundStyle(.white)
					)
					.frame(width: width, height: height)
			default:
				Color.gray
					.overlay(
						Image(systemName: "exclamationmark.circle")
							.resizable()
							.scaledToFit()
							.frame(width: width/3)
							.foregroundStyle(.white)
					)
					.frame(width: width, height: height)
			}
		}
		.scaledToFill()
		.frame(width: width, height: height)
	}
}

#Preview {
	ImageLoader(path: "https://ictechnology.com.au/wp-content/uploads/2025/06/ICTechnology-stramline-your-office-IT.webp", width: 150, height: 120)
		.clipShape(RoundedRectangle(cornerRadius: 10))
		.clipped()
}
