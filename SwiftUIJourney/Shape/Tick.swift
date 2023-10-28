//
//  Tick.swift
//  SwiftUIJourney
//
//  Created by Ishtiak Ahmed
//  LinkedIn: https://www.linkedin.com/in/ishtiakahmed/
//  Twitter: https://twitter.com/ishtiz_
//

import SwiftUI

struct Tick: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.02 * width, y: 0.7 * height))
        path.addLine(to: CGPoint(x: 0.2 * width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0.02 * height))
        return path
    }
}

#Preview {
    Tick()
}
