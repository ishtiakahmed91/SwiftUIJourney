//
//  ExpandView.swift
//  SwiftUIJourney
//
//  Created by Ishtiak Ahmed
//  LinkedIn: https://www.linkedin.com/in/ishtiakahmed/
//  Twitter: https://twitter.com/ishtiz_
//

import SwiftUI

struct ExpandView: View {
    @State private var onExpand = false
    @State private var afterExpansion = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 24, weight: .bold))

            Text(summary)
                .font(.caption)

            if onExpand {
                Text(description)
                    .font(.caption)
                    .padding()
                    .background(.white.opacity(0.08))
                    .cornerRadius(16)
                    .padding(4)
                    .overlay(RoundedRectangle(cornerRadius: afterExpansion ? 20 : 10).stroke(style: StrokeStyle(lineWidth: 1, dash: [5])))
                    .padding(.top)
            }

            HStack{
                Spacer()

                Button(action: {
                    withAnimation(.spring(duration: 0.4, bounce: 0.4)) {
                        onExpand.toggle()
                        withAnimation(.default.delay(0.3)) {
                            afterExpansion.toggle()
                        }
                    }
                }, label: {
                    HStack(spacing: afterExpansion ? 0 : 8) {
                        ZStack {
                            VStack(spacing: 2) {
                                Capsule()
                                    .frame(width: 24, height: 2)
                                    .rotationEffect(.degrees(afterExpansion ? 90 : 0))
                                    .opacity(afterExpansion ? 0 : 1)
                                Capsule()
                                    .frame(width: 24, height: 2)
                                    .rotationEffect(.degrees(afterExpansion ? 270 : 0))
                                    .opacity(afterExpansion ? 0 : 1)
                                Capsule()
                                    .frame(width: afterExpansion ? 10 : 24, height: 2)
                                    .rotationEffect(.degrees(afterExpansion ? 450 : 0))
                            }

                            if afterExpansion {
                                Image(systemName: "arrow.up")
                            }
                        }
                        Text(afterExpansion ? "" : "Expand")
                            .font(.system(size: 10, weight: .bold))
                    }
                })
                .padding(8)
                .background()
                .cornerRadius(afterExpansion ? 36 : 4)
                .tint(.yellow)
            }
        }
        .padding()
        .background(Constants.Colors.redwood)
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    ExpandView()
        .preferredColorScheme(.dark)
}
