# Flashcard App
The Flashcard app is a simple iOS application for creating and studying flashcards. It allows users to create custom flashcards with questions and answers, and includes features for shuffling, deleting, and editing existing flashcards. The app was developed using Swift and the UIKit framework. This is the most recent update to the app, and subsequent updates will be made under this new repository. A link to the old version of this app is here: https://github.com/branley1/FlashcardApp. 

## Getting Started
To install and run locally Flashcard app, you'll need a Mac running macOS 11 or later, and Xcode 13 or later installed. Clone the repository: ```git clone https://github.com/branley1/flashcard-update```, then navigate to the directory: ```cd flashcard-update```

Once you have Xcode installed, you can open the Flashcards project by double-clicking on the Flashcards.xcodeproj file. You can then build and run the app using the simulator or a physical iOS device.

## Table of Contents
- [Flashcard App](#flashcards-app)
- [Getting Started](#getting-started)
- [Technologies Used](#technologies-used)
- [Features](#features)
- [Code Overview](#code-overview)
- [Future Plans](#future-plans)
- [Credits](#credits)
- [Contributing](#contributing)
- [Licenses](#licenses)

## Technologies Used
The Flashcard App is built using Swift programming language and Xcode for iOS devices. It also includes third-party libraries such as SnapKit for AutoLayout and SwipeCellKit for swipeable table view cells among others (see source code for more details). The app requires a fundamental knowledge of the SwiftUI toolkits, and Swift programming language.

## Features
The Flashcard App has the following features:

- Create flashcards with a question and multiple answers.
- Edit existing flashcards.
- Delete flashcards.
- Study flashcards in a random order (coming soon).
- See the correct answer after flipping the flashcard.

## Code Overview
The Flashcard app is built using the Model-View-Controller (MVC) design pattern. The Flashcard model represents a flashcard, with a question, answer, and two extra answers. The ViewController class is the main view controller for the app, and manages the display of flashcards and the user interface. The CreationViewController class is a secondary view controller for creating and editing flashcards.

The ViewController class uses a UIPageViewController to manage the display of flashcards. The Flashcard model is stored in an array, and the ViewController class manages the current index of the array to display the current flashcard. The user interface allows the user to flip the flashcard to see the answer, and swipe left or right to go to the next or previous flashcard.

The CreationViewController class allows the user to create or edit a flashcard. It has four text fields for the question, answer, and two extra answers. When the user taps the "Done" button, the CreationViewController class validates the input and either creates a new flashcard or updates an existing flashcard.

## Future Plans
In future, I intend to add the following features to the Flashcard app:
- Study flashcards in a random order
- Study flashcards in the Study view, with options to mark cards as correct or incorrect and track progress
- Share flashcards with other users
- Add support for images and multimedia in flashcards
- Allow for multiple customizable fonts
- Users can create a basic user profile with name, email and other relevant identifying or non-identifying data.
- Allow users to be able to import and export flashcards as CSV files
- Intergration with APIs such as: 
    - Quizlet API to allow users to import flashcards from Quizlet
    - Dictionary API to allow users to quickly and easily look up the definitions of words on their flashcards 
    - Speech Recognition APIs & Speech Synthesis APIs to allow users to dictate questions and answers and allow the app to read flashcards into different languages among others.

## Credits
This app has been mainly designed by me (Branley Mmasi). I acknowledge that the basic foundations for the app were legally sourced from Codepath.org, such as the next and previous buttons, but I'm concurrrently also working on a completely new design from the ground up and will only incorporate the main features of the app, with very many improvements on the general design and layout. 

## Contributing
If you would like to contribute to the Flashcard app, you can fork the project and create a pull request. Before submitting a pull request, please make sure your changes are tested and adhere to the project's coding style. I welcome all contributions to the Flashcard App.

## Licenses
The Flashcard app is licensed under the MIT License. Third-party libraries used in the app are subject to their own licenses, which are included in the app's source code. See the [LICENSE](LICENSE) file for details.

If anyone needs any piece of the code please do not hesistate to reach out to me via email: mmasi.branley@gmail.com.
