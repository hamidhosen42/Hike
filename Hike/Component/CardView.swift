//
//  CardView.swift
//  Hike
//
//  Created by Md.Hamid Hosen on 3/5/25.
//

import SwiftUI

struct CardView: View {
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
                        } label: {
                            CustomButtonView()
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
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color("ColorIndigoMedium"),
                                    Color("ColorSalmonLight"),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 256, height: 256)

                    Image("Images/image-1")
                        .resizable()
                        .scaledToFit()
                }

                // MARK: - FOOTER (Future content)
                Spacer()  // placeholder for your footer content
            }
        }  //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
