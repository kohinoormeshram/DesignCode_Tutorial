//
//  ContentView.swift
//  DesignCode
//
//  Created by Admin on 06/08/20.
//  Copyright © 2020 NucleyaZ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: showCard ? 20 : 0)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation.default
                        .delay(0.1)
//                        .speed(2)
            )
            
            BackCardView()
                .frame(maxHeight : showCard ? 280 : 220.0)
                .frame(maxWidth : showCard ? .infinity : 340.0)
                .background(showCard ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(viewState)
                .offset(y: showCard ? -200 : 0)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: showCard ? 0 : 10))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))

            
            BackCardView()
                .frame(maxHeight : showCard ? 280 : 220.0)
                .frame(maxWidth : showCard ? .infinity : 340.0)
                .background(showCard ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(viewState)
                .offset(y: showCard ? -150 : 0)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: showCard ? 0 : 5))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 5.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))

            CardView()
                .frame(maxHeight : showCard ? 280 : 220.0)
                .frame(maxWidth : showCard ? .infinity : 340.0)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(viewState)
                .offset(y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture()
                .onChanged{ value in
                    self.viewState = value.translation
                    self.show  = true
                }
                .onEnded{ value in
                    self.viewState = CGSize.zero
                    self.show = false
                }
            )
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 450 : 1000)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.6))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                
                VStack(alignment :.leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            Image("Background1")
            
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing : 20) {
            
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .frame(maxWidth : .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
