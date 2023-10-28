//
//  VoteReactionView.swift
//  SwiftUIJourney
//
//  Created by Ishtiak Ahmed
//  LinkedIn: https://www.linkedin.com/in/ishtiakahmed/
//  Twitter: https://twitter.com/ishtiz_
//

import SwiftUI

struct NumberText: View {
    @Binding var number: Int

    var body: some View {
        ZStack {
            Color.black
                .cornerRadius(10)

            Text("\(number)")
                .font(.system(size: 20, weight: .bold).monospacedDigit())
                .fontWeight(.bold)
                .contentTransition(.numericText())
                .transaction { transaction in
                    transaction.animation = .default.delay(0.4)
                }
                .foregroundColor(.white)
        }
        .frame(width: 60, height: 20)
    }
}

struct VoteReactionView: View {
    @State private var upvote = 0
    @State private var downvote = 0

    var body: some View {
        HStack {
            HStack {
                NumberText(number: $upvote)

                Button {
                    upvote += 1
                } label: {
                    Label("Upvote", systemImage: "arrowtriangle.up.fill")
                        .font(.system(size: 14, weight: .bold))
                        .tint(.green)
                }
                .symbolEffect(.bounce, options: .speed(3).repeat(2), value: upvote)
                .symbolEffect(.pulse)
            }
            .padding(10)
            .background(.white.opacity(0.3))
            .cornerRadius(20)

            HStack {
                NumberText(number: $downvote)

                Button {
                    downvote += 1
                } label: {
                    Label("Downvote", systemImage: "arrowtriangle.down.fill")
                            .font(.system(size: 14, weight: .bold))
                            .tint(.red)
                }
                .symbolEffect(.bounce, options: .speed(3).repeat(2), value: downvote)
            }
            .padding(10)
            .background(.white.opacity(0.3))
            .cornerRadius(20)
        }
    }
}

#Preview {
    VoteReactionView()
        .preferredColorScheme(.dark)
}
