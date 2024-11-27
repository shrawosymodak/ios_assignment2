import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    // Interactive background - to track the drag gesture
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        ZStack {
            // Interactive Gradient Background
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.4)
                .rotationEffect(.degrees(Double(dragAmount.width / 10)))  // Rotate based on drag
                .offset(dragAmount)
                .edgesIgnoringSafeArea(.all)
                .gesture(DragGesture()
                            .onChanged { value in
                                self.dragAmount = value.translation
                            }
                            .onEnded { _ in
                                withAnimation {
                                    self.dragAmount = .zero
                                }
                            })
            
            VStack(spacing: 30) {
                
                // Email Text Field
                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 8, x: 0, y: 5)
                    .padding(.top, 60)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                // Password Text Field
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 8, x: 0, y: 5)
                
                // Error Message Display
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .bold()
                        .padding(.top, 10)
                        .transition(.opacity)
                }
                
                // Sign-up Button
                Button(action: register) {
                    HStack {
                        Text("Sign Up")
                            .bold()
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15)
                            .shadow(radius: 8)
                            .scaleEffect(isLoading ? 0.95 : 1.0) // Adding animation when clicked
                    }
                }
                .padding(.horizontal)
                .disabled(isLoading) // Disable button when loading
                
                // Log-in Button
                Button(action: login) {
                    HStack {
                        Text("Log In")
                            .bold()
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [.green, .yellow]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15)
                            .shadow(radius: 8)
                            .scaleEffect(isLoading ? 0.95 : 1.0)
                    }
                }
                .padding(.horizontal)
                .disabled(isLoading)
                
                // Loading Indicator
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                        .padding(.top, 20)
                }
            }
            .padding(.top)
            .background(LinearGradient(gradient: Gradient(colors: [.white, .blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(30)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    // Register Function
    func register() {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.errorMessage = "Registration successful!"
                self.email = ""
                self.password = ""
            }
        }
    }
    
    // Login Function
    func login() {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.errorMessage = "Login successful!"
                userIsLoggedIn = true
            }
        }
    }
}

#Preview {
    ContentView()
}
