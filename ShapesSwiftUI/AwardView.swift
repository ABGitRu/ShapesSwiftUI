//
//  AwardView.swift
//  ShapesSwiftUI
//
//  Created by Mac on 17.06.2021.
//

import SwiftUI

struct AwardView: View {
    @State private var showAward = false
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(showAward ? "Hide award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .rotationEffect(.degrees(showAward ? 0: 180))
//                        .animation(.default)
                }

            }
            Spacer()
            if showAward {
                GradientRectangles(width: 250, height: 250)
                    .transition(transition)
            }
                
//                    .offset(x: showAward ? 0 : -UIScreen.main.bounds.width)
//                    .animation(.easeInOut(duration: 0.7))
            
//                    .animation(.interpolatingSpring(
//                                mass: 1,
//                                stiffness: 100,
//                                damping: 10,
//                                initialVelocity: 0)
//                    )
            
//                    .animation(.spring(
//                                response: 0.55 ,
//                                dampingFraction: 0.45,
//                                blendDuration: 0
//                        )
//                    )
                    
//                    .animation(Animation.spring().delay(0.3).speed(0.5).repeatCount(2))
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    private func buttonAction() {
        withAnimation {
            showAward.toggle()
        }
    }
}

extension AwardView {
    var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct AwardView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView()
    }
}
