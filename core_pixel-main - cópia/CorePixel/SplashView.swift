import SwiftUI

struct SplashView: View {
    @State private var offsetX: CGFloat = -400
    @State private var offsetY: CGFloat = 450
    @State private var quadradoCor: Color = Color.white
    @State private var changeColor = false // Estado para controle da cor
    @State private var showLogo = false

    var body: some View {
        ZStack {
            
            
            Image("pincel")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .offset(x: offsetX, y: offsetY)
                .animation(Animation.timingCurve(0.3, 0.5, 0.2, 2.5, duration: 2.9), value: [offsetX, offsetY])
                .zIndex(100)
                .opacity(showLogo == true ? 0 : 1)
            
            if showLogo {
                Rectangle()
                    .fill(Color.white)
                    .zIndex(89)
                
                Image("CorePixel")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1000, height: 1000)
                    .transition(.scale.combined(with: .opacity))
                    .animation(.easeInOut(duration: 1.5), value: showLogo)
                    .zIndex(90)
            }


            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 1, y: -141)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 62, y: -80)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 123, y: -80)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 184, y: -80)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 245, y: -80)
            
            AnimatedRectangle(changeTime: 2.65, initialColor: Color.gray.opacity(0.2), finalColor: Color.pink, squareZIndex: 1)
                .offset(x: 1, y: -80)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 123, y: -141)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 184, y: -141)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 245, y: -141)
            
            
            AnimatedRectangle(changeTime: 2.40, initialColor: Color.gray.opacity(0.2), finalColor: Color.blue, squareZIndex: 1)
                .offset(x: 62, y: -141)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 245, y: -202)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 184, y: -202)
            
            AnimatedRectangle(changeTime: 2.15, initialColor: Color.gray.opacity(0.2), finalColor: Color.black, squareZIndex: 1)
                .offset(x: 123, y: -202)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 1, y: -202)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 62, y: -202)
            
            AnimatedRectangle(changeTime: 1.85, initialColor: Color.gray.opacity(0.2), finalColor: Color.blue, squareZIndex: 1)
                .offset(x: 184, y: -263)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 1, y: -263)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 62, y: -263)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 123, y: -263)
            
            AnimatedRectangle(changeTime: 1.30, initialColor: Color.gray.opacity(0.2), finalColor: Color.pink, squareZIndex: 1)
                .offset(x: 245, y: -324)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 245, y: -263)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 184, y: -324)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 123, y: -324)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 62, y: -324)
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .offset(x: 1, y: -324)
                
                
        }
        .onAppear {
            offsetX = offsetX == 0 ? 100 : 0
            offsetY = offsetY == 0 ? -150 : 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.4) {
                            withAnimation {
                                showLogo = true
                                
                                offsetX = 500
                                
                            }
                
                        }
            
        }
    }
}

#Preview {
    SplashView()
}
