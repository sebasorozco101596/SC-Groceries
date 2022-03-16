//
//  NewExpiredDateView.swift
//  SC Groceries
//
//  Created by Juan Sebastian Orozco Buitrago on 3/16/22.
//

import SwiftUI

struct NewExpiredDateView: View {
    
    //MARK: - PROPERTIES
    
    //@Environment(\.managedObjectContext) private var viewContext
    @State var task: String = ""
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty // If the user put anything in the TextField the variable toggle
    }
    
    //MARK: - FUNCTIONS
    
    private func addItem() {
        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//            newItem.task = task
//            newItem.completion = false
//            newItem.id = UUID()
//
//            do {
//                try viewContext.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    //MARK: - BODY
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                
                Text("24 March 2022")
                    .font(.title3.bold())
                    .foregroundColor(Color("Orange"))
                
                TextField("Grocery", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button {
                    addItem()
                    //playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                }
                .disabled(isButtonDisabled)
//                .onTapGesture {
//                    if isButtonDisabled {
//                        playSound(sound: "sound-tap", type: "mp3")
//                    }
//                }
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color("Green-hard") : Color("Orange"))
                .cornerRadius(8)

            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VSTACK
        .padding()
    }
}

struct NewExpiredDateView_Previews: PreviewProvider {
    static var previews: some View {
        NewExpiredDateView(isShowing: .constant(true))
            .background(
                Color.gray.edgesIgnoringSafeArea(.all)
            )
    }
}
