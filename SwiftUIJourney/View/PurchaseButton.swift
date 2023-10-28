//
//  PurchaseButton.swift
//  SwiftUIJourney
//
//  Created by Ishtiak Ahmed
//  LinkedIn: https://www.linkedin.com/in/ishtiakahmed/
//  Twitter: https://twitter.com/ishtiz_
//

import SwiftUI

struct PurchaseButton: View {
    @State private var onClicked = false
    @State private var drawCircle = false
    @State private var drawTick = false
    let angularGradient = AngularGradient(gradient: Gradient(colors: [.yellow, .green, .blue, .purple]), center: .center)
    let linearGradient = LinearGradient(colors: [.black, .indigo, .blue], startPoint: .top, endPoint: .bottom)

    var body: some View {
        Button(action: {
            withAnimation {
                onClicked.toggle()
            }
        }, label: {
            HStack {
                Text("Purchase").fixedSize()
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)

                if onClicked {
                    ZStack {
                        Circle()
                            .trim(from: 0, to: drawCircle ? 1 : 0)
                            .stroke(angularGradient, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                            .frame(width: 40)

                        Tick()
                            .trim(from: 0, to: drawTick ? 1 : 0)
                            .stroke(linearGradient, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                            .frame(width: 40, height: 36)
                            .offset(x: 12, y: -13)
                    }
                    .onAppear {
                        withAnimation(.snappy(duration: 0.6).delay(1)) {
                            drawCircle = true
                        }

                        withAnimation(.easeOut(duration: 2).delay(1.5)) {
                            drawTick = true
                        }
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(.white)
            .cornerRadius(20)
        })
    }
}

#Preview {
    PurchaseButton()
}
