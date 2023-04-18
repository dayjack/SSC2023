//
//  SwiftUIView.swift
//  
//
//  Created by ChoiYujin on 2023/04/12.
//

import SwiftUI

struct TimerView: View {
    
    @State var scale = 1.0
    @State var isButtonHidden: Bool  = true
    @State private var seconds = 3
    
    var body: some View {
        NavigationView {
            ZStack {
               bgView()
                
                VStack {
                    
                    textTitleView(text: "\(seconds)")
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 4)
                        }
                        .font(.largeTitle)
                        .onAppear {
                            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                if self.seconds > 0 {
                                    self.seconds -= 1
                                } else {
                                    withAnimation(.easeOut(duration: 1)) {
                                        isButtonHidden = false
                                    }
                                }
                            }
                            RunLoop.current.add(timer, forMode: .common)
                        }
                    
                    textTitleView(text: "The duration of human existence on this planet is only a mere 3 seconds.")
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 4)
                        }
                        .opacity(isButtonHidden ? 0 : 1)
                        .padding(30)
                        
                    
                    
                    
                } // 이 곳은 각 뷰로 교체해가면서 쓸수 있을까
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            StoryView4()
                        } label: {
                            nextLabel()
                        }
                        .opacity(isButtonHidden ? 0 : 1)
                        .scaleEffect(scale)
                        .onAppear {
                            let baseAnimation = Animation.easeInOut(duration: 1)
                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                            withAnimation(repeated) {
                                scale = 0.5
                            }
                        }
                        
                    }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 100)
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .statusBarHidden()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
