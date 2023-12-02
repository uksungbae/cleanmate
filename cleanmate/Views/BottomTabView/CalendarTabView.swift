//
//  RedTabView.swift
//  cleanmate
//
//  Created by 김선규 on 11/20/23.
//

import SwiftUI

struct CalendarTabView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.red)
            
            Text("\(2)")
                .font(.system(size: 70))
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

