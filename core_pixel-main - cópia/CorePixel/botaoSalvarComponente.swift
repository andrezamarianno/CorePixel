import SwiftUI

struct botaoSalvar: View {
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 170, height: 50)
                .cornerRadius(30)
                .foregroundColor(Color("VerdeSalvar"))
              
            
            Text("Salvar")
                .foregroundStyle(Color.white)
                .bold()
                .font(.system(size: 20))
        }
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    botaoSalvar(action: {
        print("chama o alerta de salvar")
    })
}
