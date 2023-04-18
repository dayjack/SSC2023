//
//  EndingView.swift
//  
//
//  Created by ChoiYujin on 2023/04/17.
//

import SwiftUI

struct EndingView: View {
    
    @State private var animationStart = false
    @State private var animationEnd = false
    @State var isTransit: Bool = false
    private let startAnimationDuration = 10.0
    
    var body: some View {
        ZStack {
            Color.blue
                .opacity(0.4)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                VStack {
                    Image("earthNext")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .opacity(0.7)
                    Text("The End")
                        .font(.custom("Gmarket Sans TTF", size: 60))
                        .padding(40)
                        .background(.green.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                Spacer()
                    ScrollView {
                        Text ("\n\n\n\n\n\n\n\nMade by Eugene Choi\n\nPlease refer to 'License.txt' in Resources folder for detailed information regarding the license.\n\n\n\n\n\n\n\n")
                        .font(.custom("Gmarket Sans TTF", size: 60))
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.leading)
                        .background(.green.opacity(0.4))
                        .lineSpacing (30)
                        .foregroundColor(.white)
                        .offset(y: animationStart ? -500 : 0)
                        .animation (Animation.linear(duration: startAnimationDuration),value: animationStart)
                        .onAppear() {
                            self.animationStart.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + self.startAnimationDuration) {
                                self.animationEnd.toggle()
                            }
                        }
                    }
                Spacer()
            }
            
        }
        
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
