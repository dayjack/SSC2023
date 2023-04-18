//
//  StoryView2.swift
//
//
//  Created by ChoiYujin on 2023/04/12.
//

import SwiftUI

struct StoryView2: View {
    
    @State var isButtonHidden: Bool  = true
    @State var isTouchable: Bool = true
    @State var storyTextArr: [String] = [
        "Are you familiar with dinosaurs?",
        "At one time, dinosaurs reigned \nover the Earth.",
        "Then, for how long did they exist?",
        "Regrettably, dinosaurs didn't survive \neven a single hour."
    ]
    @State var index: Int = 0
    @State var scale = 1.0
    
    var body: some View {
        NavigationView {
            ZStack {
                bgView()
                textTitleView(text: storyTextArr[index])
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 4)
                    }
                    .multilineTextAlignment(.center)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            DinosaurView()
                        } label: {
                            nextLabel()
                        }
                        .opacity(isButtonHidden ? 0 : 1)
                        .scaleEffect(scale)
                        
                    }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 100)
                }
            }
            .allowsHitTesting(isTouchable)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .statusBarHidden()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            if index + 1 == storyTextArr.count {
                isButtonHidden = false
            } else {
                withAnimation(.easeOut(duration: 0.4)) {
                    index += 1
                }
            }
            let baseAnimation = Animation.easeInOut(duration: 1)
            let repeated = baseAnimation.repeatForever(autoreverses: true)
            withAnimation(repeated) {
                scale = 0.5
            }
        }
    }
}

struct StoryView2_Previews: PreviewProvider {
    static var previews: some View {
        StoryView2()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


