//
//  CardView.swift
//  Hike
//
//  Created by Md.Hamid Hosen on 3/5/25.
//

import SwiftUI

struct CardView: View {

    // MARK:- PROPERTIES

    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false

    //MARK: - FUNCTIONS

    func randomImage() {
        print("--- BUTTON WAS PRESSED ---")
        print("Status: Old Image Number = \(imageNumber)")

        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")
        } while randomNumber == imageNumber

        imageNumber = randomNumber

        print("Result: New Image Number = \(imageNumber)")
        print("--- THE END ---")
        print("\n")
    }

    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()

            VStack {

                Spacer()

                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium,
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )

                        Spacer()

                        Button {
                            // ACTION: Show a Sheet
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(
                            isPresented: $isShowingSheet
                        ) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }

                    }

                    Text(
                        "Fun and enjoyable outdoor activity for friends and families."
                    )
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(.customGrayMedium)
                }  //: HEADER
                .padding(.horizontal, 30)

                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()

                    Image("Images/image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1), value: imageNumber)
                }

                // MARK: - FOOTER (Future content)

                Button {
                    // ACTION: Generate a random number

                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium,
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color: .black.opacity(0.25), radius: 0.25, x: 1,
                            y: 2)
                }
                .buttonStyle(GradientButton())

                Spacer()
            }
        }  //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
