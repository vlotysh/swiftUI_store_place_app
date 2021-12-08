//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Vlad Lotysh on 08.12.2021.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData

    @State private var draftProfile = Profile.default
    @State var items = ["One", "Two", "Three"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            ProfileSummary(profile: modelData.profile)
            List {
                ForEach(items, id: \.self) { item in
                    NavigationLink(destination: Text(item), label: {
                        Text(item)
                    })
                }
                .onDelete(perform: { IndexSet in items.remove(atOffsets: IndexSet) })
                .onMove(perform: { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationBarTitle("List", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
            .environment(\.editMode, editMode) //#
            
            if editMode?.wrappedValue == .active {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
