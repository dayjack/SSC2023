//
//  File.swift
//  
//
//  Created by ChoiYujin on 2023/04/13.
//

import Foundation
import SwiftUI

extension View {
    
    
    /// 배경이미지 뷰를 리턴하는 함수
    /// - Returns: 배경화면에 쓰일 이미지 + 속성
    func bgView() -> some View {
        return VStack {
            Image("earth-vectorportal")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .opacity(0.8)
                .padding(20)
            
        }
    }
    
    func dinoBgView() -> some View {
        return VStack {
            Image("dinobg")
                .resizable()
                .scaledToFit()
                .opacity(0.8)
        }
    }
    
    /// 버튼 레이블에 쓰일 공통 뷰
    /// - Returns: 버튼 레이블에 쓰일 공통 뷰
    func nextLabel() -> some View {
        return VStack {
            ZStack {
                Color.yellow.opacity(0.6)
                    .cornerRadius(40)
                HStack {
                    Image("earthNext")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .padding(20)
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .padding(.horizontal, 20)
                }
                .padding(20)
            }
            .frame(width: 280, height: 160)
        }
    }
    
    func textTitleView(text : String) -> some View {
        return VStack {
            Text(text)
                .font(.custom("Gmarket Sans TTF", size: 52))
                .baselineOffset(10)
                .padding(.top, 10)
                .padding(20)
                .background(.white)
                .cornerRadius(12)
                .lineSpacing(28)
        }
    }
}
