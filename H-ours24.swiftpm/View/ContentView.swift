import SwiftUI

struct ContentView: View {
    
    @State var isScrollNeed: Bool = false
    @State var scale = 1.0
    @State var date = Date()
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        return formatter
    }
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            self.date = Date()
        })
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.yellow.opacity(0.4)
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        VStack {
                            if isScrollNeed {
                                Text("Scroll to view more")
                                    .font(.custom("Gmarket Sans TTF", size: 32))
                                    .baselineOffset(10)
                                    .padding(.top, 10)
                                    .foregroundColor(.blue)
                                    .padding()
                            }
                            
                            ScrollView {
                                GeometryReader { scrollViewGeometry in
                                    VStack {
                                        
                                        Text("\(timeString(date: date))\n\n\(earthInfo())")
                                        //                                            .frame(width: scrollViewGeometry.size.width - 40, height: scrollViewGeometry.size.height)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .lineLimit(20)
                                            .font(.custom("Gmarket Sans TTF", size: 52))
                                            .baselineOffset(10)
                                            .padding(.top, 10)
                                            .padding(20)
                                            .background(.white)
                                            .cornerRadius(12)
                                            .lineSpacing(20)
                                            .onAppear(perform: {let _ = self.updateTimer})
                                            .multilineTextAlignment(.center)
                                            .background(
                                                GeometryReader { contentGeometry in
                                                    Color.clear
                                                        .onAppear {
                                                            let scrollViewHeight = scrollViewGeometry.size.height
                                                            let contentHeight = contentGeometry.size.height
                                                            print(scrollViewHeight)
                                                            print(contentHeight)
                                                            
                                                            
                                                            if contentHeight > scrollViewHeight {
                                                                isScrollNeed = true
                                                            } else {
                                                                isScrollNeed = false
                                                            }
                                                        }
                                                }
                                            )
                                    }
                                    
                                    
                                }
                            } //
                            
                            
                        }
                        .padding(40)
                        LottieView(filename: "ourEarth")
                            .frame(height: UIScreen.main.bounds.height / 2)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            StoryView2()
                        } label: {
                            nextLabel()
                                .scaleEffect(scale)
                                .onAppear {
                                    let baseAnimation = Animation.easeInOut(duration: 1)
                                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                                    withAnimation(repeated) {
                                        scale = 0.5
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 100)
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .statusBarHidden()
    }
}

struct ContentView_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

