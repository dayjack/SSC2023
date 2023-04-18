//
//  StoryView4.swift
//
//
//  Created by ChoiYujin on 2023/04/12.
//

import SwiftUI

struct StoryView4: View {
    
    @State var isButtonHidden: Bool  = true
    @State var isTouchable: Bool = true
    @State var storyTextArr: [String] = [
        "The fact that our existence on this planet \nlasts only for a mere 3 seconds",
        "Isn't it truly shocking?",
        "During this short period",
        "We have been recklessly using the resources \nprovided by the Earth.",
        "However, this behavior can \nlead to the depletion of natural resources \nand environmental issues.",
        "That's why, as beings borrowing the Earth, we must handle it with care.",
        "We must strive to be responsible \nand sustainable in our use of resources",
        "So that we can pass on a \nhabitable planet to future generations."
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
                                    RentView()
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

struct StoryView4_Previews: PreviewProvider {
    static var previews: some View {
        StoryView4()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
