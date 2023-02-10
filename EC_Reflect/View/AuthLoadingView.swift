//
//  AuthLoadingView.swift
//  EC_Reflect
//
//  Created by Ilia Sedelkin on 09/02/23.
//

import SwiftUI

struct AuthLoadingView: View {
    
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        ProgressView()
        // Calling asyncronous FaceID function when the view is launched
            .task {
                print("DEBUG: Async FaceID activated")
                await authVM.authenticate()
            }
    }
}

struct AuthLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        AuthLoadingView(authVM: AuthViewModel())
    }
}
