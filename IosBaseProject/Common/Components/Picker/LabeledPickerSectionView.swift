import SwiftUI

struct LabeledPickerSectionView: View {
	let title: Text
	let value: String
	let isLoading: Bool
	let height: CGFloat?
	let isDisabled: Bool
	let action: (() -> Void)?
	
	init(
		title: Text,
		value: String,
		isLoading: Bool = false,
		height: CGFloat?,
		isDisabled: Bool = false,
		action: (() -> Void)? = nil
	) {
		self.title = title
		self.value = value
		self.isLoading = isLoading
		self.height = height
		self.isDisabled = isDisabled
		self.action = action
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack {
				title
					.font(.baseStyle(size: 16, weight: .medium))
					.foregroundStyle(.neutral90)
					.padding(.horizontal, 2)
				
				if isLoading {
					ProgressView()
						.progressViewStyle(.circular)
						.scaleEffect(0.8)
				}
			}
			
			
			if isDisabled {
				content
			} else {
				Button {
					action?()
				} label: {
					content
				}
			}
		}
	}
	
	private var content: some View {
		HStack {
			Text(value)
				.font(.baseStyle(size: 16, weight: .regular))
				.foregroundStyle(isDisabled ? .neutral60 : .neutral90)
			Spacer()
			Image(.chevronDownIcon)
		}
		.frame(height: height ?? nil)
		.padding(12)
		.background(
			RoundedRectangle(cornerRadius: 8)
				.foregroundStyle(.clear)
				.foregroundStyle(.neutral60)
		)
		.overlay {
			RoundedRectangle(cornerRadius: 8)
				.stroke(lineWidth: 1)
				.foregroundStyle(.neutral60)
		}
		.clipShape(RoundedRectangle(cornerRadius: 8))
	}
}

#Preview {
	LabeledPickerSectionView(
		title: Text("State"),
		value: "Select state",
		isLoading: false,
		height: nil,
		isDisabled: false
	)
	.padding()
	.background(.white)
	
	LabeledPickerSectionView(
		title: Text("State"),
		value: "Select state",
		isLoading: true,
		height: nil,
		isDisabled: true,
		action: { }
	)
	.padding()
	.background(.white)
}
