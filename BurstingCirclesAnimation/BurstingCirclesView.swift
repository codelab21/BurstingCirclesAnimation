//
//  BurstingCirclesView.swift
//  BurstingCirclesAnimation
//
//  by CodeLab on 25.07.2023.
//

import SwiftUI

struct BurstingCirclesView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background color
            VStack {
                ZStack {
                    ForEach(0..<6) { index in
                        Circle()
                            .foregroundColor(.random)
                            .scaleEffect(isAnimating ? 1.0 : 0.2)
                            .opacity(isAnimating ? 1.0 : 0.0)
                            .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true).delay(0.2 * Double(index)))
                            .padding(50)
                            .onAppear {
                                self.isAnimating = true
                            }
                    }
                }
                VStack(alignment: .leading, spacing: 15) {
                    Text("FOLLOW @codelab21 FOR MORE!")
                        .bold()
                        .foregroundColor(.gray)
                    Text("Source code is available on GitHub Link in Bio https://github.com/codelab21")
                        .font(.callout).bold()
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0.2...1),
            green: .random(in: 0.2...1),
            blue: .random(in: 0.2...1)
        )
    }
}

struct BurstingCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        BurstingCirclesView()
    }
}
