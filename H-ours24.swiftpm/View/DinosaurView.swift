//
//  DinosaurView.swift
//  
//
//  Created by ChoiYujin on 2023/04/13.
//

import SwiftUI

struct DinosaurView: View {
    
    @State var isButtonHidden: Bool = true
    @State var scale = 1.0
    @State var isDinoHidden: Bool = true
    @State var degrees : Double = 180
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    VStack {
                        dinoBgView()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .frame(width: geo.size.width, height: geo.size.height)
                    }
                    
                    LottieView(filename: "meteor")
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    VStack {
                        textTitleView(text: "Where could a dinosaur hide to avoid a meteor? Where might it be?")
                            .font(.custom("Gmarket Sans TTF", size: 60))
                            .padding(.top, 10)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.vertical, 50)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Image("mydino")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 500)
                                .opacity(isDinoHidden ? 0.3 : 1)
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 1)) {
                                        isDinoHidden = false
                                        degrees = degrees == 180 ? 360 : 180
                                    }
                                }
                                .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
                            Spacer()
                        }
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            if !isDinoHidden {
                                NavigationLink {
                                    StoryView3()
                                } label: {
                                    nextLabel()
                                        .scaleEffect(scale)
                                }
                                .onAppear {
                                    let baseAnimation = Animation.easeInOut(duration: 1)
                                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                                    withAnimation(repeated) {
                                        scale = 0.5
                                    }
                                }
                                .padding(.horizontal, 100)
                                .padding(.vertical, 100)
                            }
                        }
                    }
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .statusBarHidden()
        .navigationBarBackButtonHidden(true)
        
    }
}


struct DinosaurView_Previews: PreviewProvider {
    static var previews: some View {
        DinosaurView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
