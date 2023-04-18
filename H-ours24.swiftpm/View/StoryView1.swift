//
//  StoryView.swift
//  
//
//  Created by ChoiYujin on 2023/04/12.
//

import SwiftUI

struct StoryView1: View {
    
    @State var isButtonHidden: Bool  = true
    @State var isTouchable: Bool = true
    @State var storyTextArr: [String] = [
        "Do you know the age of the Earth?",
        "The age of the Earth is estimated\nto be 4.6 billion years.",
        "The timescale of 4.6 billion years\nmay be difficult to imagine.",
        "So, to help understand this more easily,",
        "If we compare the age of the Earth \nto 24 hours,",
        "What is currently happening \non Earth right now?"
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
                            ContentView()
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
        .onAppear {
            SoundModel.instance.playSound()
        }
    }
}

struct StoryView1_Previews: PreviewProvider {
    static var previews: some View {
        StoryView1()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

