# Naruto Anime Character

This is an iOS application that allows users to browse, search, and view details of characters from the Naruto anime series. The application utilizes the [Dattebayo API](https://dattebayo-api.onrender.com) for fetching character data and is built using SwiftUI following the MVVM architecture.

## Features

- **Browse Characters**: Users can browse through a list of Naruto characters.
- **Character Details**: Users can view detailed information about each character.
- **Search Functionality**: Users can search for characters by name.
- **Dynamic UI**: Responsive and dynamic user interface built with SwiftUI.
- **MVVM Architecture**: Implements the Model-View-ViewModel (MVVM) design pattern for better code organization and maintainability.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/mohd-kasif/Naruto-Universe.git
    
    ```
3. Build and run the project on your simulator or device.

## Usage

1. Launch the app on your iOS device or simulator.
2. Browse through the list of Naruto characters on the home screen.
3. Tap on any character to view detailed information.
4. Use the search bar to find characters by name.

## MVVM Architecture

This project follows the MVVM (Model-View-ViewModel) architecture:

- **Model**: Defines the data structures and manages the data (Character, API response models).
- **View**: The UI components built using SwiftUI (Views, Subviews).
- **ViewModel**: Acts as a bridge between the Model and View, handling business logic and data manipulation (CharacterViewModel, SearchViewModel).

## API Integration

The application integrates with the Dattebayo API to fetch character data. All network requests and data handling are managed within the ViewModels to ensure a clean separation of concerns.


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgements

- [Dattebayo API](https://dattebayo-api.onrender.com) for providing the Naruto character data.
- The Naruto anime series for inspiration and content.
