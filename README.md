# ios_assignment2
Assignment topic : Firebase integration,Sign up,Login,Firestore

Roll             : 2007034,2007035,2007039


2007034  :

During the lab session, I successfully connected our iOS project to Firebase after multiple attempts.
Initially, I created a Firebase project in the Firebase Console, downloaded the GoogleService-Info.plist file,
and added it to the root directory of the Xcode project. I then proceeded to integrate the Firebase SDK by going
to File > Swift Packages > Add Package Dependency, entering the URL for the Firebase iOS SDK GitHub repository 
(https://github.com/firebase/firebase-ios-sdk.git), and selecting the necessary SDKs such as Authentication and 
Firestore. After the SDKs were downloaded and linked, I initialized Firebase in the AppDelegate file by adding FirebaseApp.configure().

I encountered some challenges and had to try three times before succeeding. Additionally, in the Linker File Flag, I added "ObjC",
although I was unsure of its exact purpose. I followed a detailed tutorial on Medium for this integration, which guided me through
these steps. Once Firebase services were enabled in the Firebase Console, I ran the app to verify successful integration and connectivity
with Firebase. This process allowed for a smooth and efficient setup.



2007035   :

For our group assignment, I was responsible for implementing the Sign-Up and Login functionalities in the iOS app.
My focus was on managing the user authentication flow using Firebase Authentication.
I created the logic for user registration, where the app securely captures the user's email and password, 
validates the inputs, and sends the data to Firebase using the createUser(withEmail:password:) method. 
Similarly, for login, I implemented the functionality to authenticate existing users via the signIn(withEmail:password:) method.

This portion of the project ensured the core authentication features of the app were functional, 
enabling users to securely sign up and log in. By successfully implementing these features, I contributed to building 
a seamless connection between the UI and Firebase backend, making it possible for users to access and interact with the app. 


2007039   :

I was responsible for designing the UI for the Sign-Up and Login screens in our iOS app.
I focused on creating an intuitive and visually appealing layout, ensuring that the input fields for email and password, 
along with buttons for sign-up, login  were well-organized and easy to interact with. I also added appropriate labels, 
placeholders to enhance usability and provide feedback during user interactions. The design 
prioritized simplicity and functionality, ensuring a smooth user experience while complementing the Firebase integration for authentication.


#Interface

![Game Interface 1](https://github.com/shrawosymodak/ios_assignment2/blob/main/Screenshot%202024-11-21%20at%201.06.22%20PM.png)
![Game Interface 1](https://github.com/shrawosymodak/ios_assignment2/blob/main/Screenshot%202024-11-21%20at%201.06.55%20PM.png)
