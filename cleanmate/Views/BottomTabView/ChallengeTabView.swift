//
//  GreenTabView.swift
//  cleanmate
//
//  Created by 김선규 on 11/20/23.
//

import SwiftUI

struct ChallengeTabView: View {
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                
                Text("\(1)")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .fontWeight(.bold)

            }
            Text("asdasdasdas")
        }
       
    }
}

//struct GreenTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
