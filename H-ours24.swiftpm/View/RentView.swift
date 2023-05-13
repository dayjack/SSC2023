//
//  RentView.swift
//  
//
//  Created by ChoiYujin on 2023/04/12.
//

import SwiftUI
import Photos

struct RentView: View {
    
    @State var isLongPressed: Bool = false
    @State var scale = 1.0
    @State var isAlertPresent: Bool = false
    @State var isEnd: Bool = false
    
    @State var nameText: String = ""
    
    let imageSize: CGSize = CGSize(width: 210 * 4, height: 297 * 4)
    
    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.4)
                .ignoresSafeArea()
            HStack {
                LetterView(isConfirmed: isLongPressed)
                    .padding(.vertical, 40)
                    .padding(.horizontal, 52)
                
                Divider()
                VStack {
                    
                    Text("Write your name here")
                        .font(.custom("Gmarket Sans TTF", size: 40))
                        .baselineOffset(10)
                        .padding(.top, 10)
                        .padding()
                    
                    TextField("ex) Eugene Choi", text: $nameText)
                        .font(.custom("Gmarket Sans TTF", size: 32))
                        .baselineOffset(10)
                        .padding(.top, 10)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 80)
                    Text("And long touch this Icon")
                        .font(.custom("Gmarket Sans TTF", size: 32))
                        .baselineOffset(10)
                        .padding(.top, 10)
                        .lineLimit(3)
                        .padding(30)
                        .multilineTextAlignment(.center)
                    
                    Image(systemName: "touchid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .padding(.horizontal, 200)
                        .foregroundColor(isLongPressed ? Color.red.opacity(1) : Color.red.opacity(0.4))
                        .onLongPressGesture {
                            isLongPressed = true
                            let highresImage = LetterView(isConfirmed: true, name: nameText).asImage(size: imageSize)
                            UIImageWriteToSavedPhotosAlbum(highresImage, nil, nil, nil)
                            isAlertPresent = true
                        }
                        .alert("Successfully saved!!\nPlease check your capture\nin your photo library.", isPresented: $isAlertPresent) {
                            Button("OK", role: .cancel) {
                                isEnd = true
                            }
                        }
                    
                        .fullScreenCover(isPresented: $isEnd) {
                            EndingView()
                        }
                    Text("You can save \nthis screen \nas a photo")
                        .font(.custom("Gmarket Sans TTF", size: 40))
                        .baselineOffset(10)
                        .padding(.top, 10)
                        .padding()
                        .padding(.vertical, 30)
                        .multilineTextAlignment(.center)
                    
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .statusBarHidden()
        
        
    }
    
    
}

struct RentView_Previews: PreviewProvider {
    static var previews: some View {
        RentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct LetterView: View {
    let backgroundColor = Color(red: 0.95, green: 0.95, blue: 0.95)
    let foregroundColor = Color.black
    let cornerRadius: CGFloat = 10
    let isConfirmed: Bool
    @State var name: String = "ex) Eugene Choi"
    
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
    
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(backgroundColor)
                .padding(40)
            
            VStack(spacing: 30) {
                
                Text("Earth Conservation Contract")
                    .font(.custom("Gmarket Sans TTF", size: 32))
                    .baselineOffset(10)
                    .padding(.top, 10)
                    .padding()
                
                HStack {
                    Spacer()
                    Text(name)
                        .font(.custom("Gmarket Sans TTF", size: 24))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(name == "ex) Eugene Choi" ? .gray : .black)
                        .baselineOffset(10)
                        .padding(.top, 10)
                        .padding(.horizontal, 40)
                }
                
                
                Text("I pledge to take action to protect the environment and promote sustainability by reducing waste, conserving natural resources, supporting renewable energy, and adopting eco-friendly practices in all aspects of my life.")
                    .font(.custom("Gmarket Sans TTF", size: 24))
                    .lineSpacing(12)
                    .baselineOffset(10)
                    .padding(.top, 10)
                    .padding(.horizontal, 40)
//                Text("\(timeString(date: date))")
                
                HStack {
                    Spacer()
                    Image(systemName: "touchid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .padding(.horizontal, 40)
                        .foregroundColor(isConfirmed ? .red : .gray.opacity(0.2))
                }
            }
        }
    }
}

extension UIView {
    func asImage() -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        return UIGraphicsImageRenderer(size: self.layer.frame.size, format: format).image { context in
            self.drawHierarchy(in: self.layer.bounds, afterScreenUpdates: true)
        }
    }
}
extension View {
    func asImage(size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: self)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        let image = controller.view.asImage()
        return image
    }
}
