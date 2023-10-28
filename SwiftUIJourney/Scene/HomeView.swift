//
//  HomeView.swift
//  SwiftUIJourney
//
//  Created by Ishtiak Ahmed
//  LinkedIn: https://www.linkedin.com/in/ishtiakahmed/
//  Twitter: https://twitter.com/ishtiz_
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VoteReactionView()
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
