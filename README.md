<div align="center">

<img src="https://user-images.githubusercontent.com/37070272/219638474-f7ac2a87-8b4e-4e9c-a916-818b539f2d9f.png" alt="repository icon" width="128">

<h1>Flutter Apps</h1>
</div>

This collection of projects serves as a resource for beginners to explore various aspects of Flutter app development. Each project is designed to demonstrate the aspects of the app development, providing you with hands-on experience and inspiration for your own Flutter applications.

## Getting Started

Follow these instructions to get the projects up and running on your local machine.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.

### Installation

1. Clone this repository:

    ```bash
    git clone https://github.com/berkaayildiz/flutter-apps.git
    ```

2. Navigate to the source directory:

    ```bash
    cd flutter-apps/apps
    ```

3. Navigate to the project you want to run:

    ```bash
    cd <project_name>
    ```

4. Install the dependencies:

    ```bash
    flutter pub get
    ```

### Running

Use the following command to run the app on a connected device or emulator:
  
```bash
flutter run
```


## Projects


### Chat Bot App 

<img
  src="https://user-images.githubusercontent.com/37070272/220718904-94817555-af52-40b1-8fa3-42286060c4fd.png"
  width=24%
  alt="Screenshot"
  align="right"
/>

"ChatBot" is a simple chatbot app with a clean UI that can interact with users and play games with them.

#### Usage
It is actually quite simple to use. The bot welcomes you and offers you three choices as soon as you launch the app. Based on your selection, the bot will carry on the conversation for you.

#### Features

The chatbot app includes the following features:

- A chat interface that allows users to ask questions and receive responses
- A simple but extensible chatbot engine that can be customized to handle a variety of use cases
- Custom widgets that allows developers to manipulate the components easily


### Earthquake Tracker App 

<img
  src="https://user-images.githubusercontent.com/37070272/221447373-d3acc894-7fae-449c-afd3-9f2855741048.png"
  width=24%
  alt="Screenshot"
  align="right"
/>

"Son Depremler" is a Flutter-based mobile application that tracks the latest earthquakes in Turkey. The app uses an API to fetch earthquake data and displays the earthquake location, magnitude, and time in a list view.

#### Usage
The most recent earthquake data will be fetched and displayed in a list format as soon as the app is launched on your mobile device. You can pull down on the screen to refresh the data and use the slider at the bottom of the screen to filter the earthquakes by their magnitude range.

#### Features

The app includes the following features:

- Display latest earthquake data in a list view
- Filter earthquakes by their magnitude range
- Pull-to-refresh to fetch the latest data


### Countdown App

<img
  src="https://user-images.githubusercontent.com/37070272/221721155-1885e257-355d-4aa9-b26c-9616d932c3bb.png"
  width=24%
  alt="Screenshot"
  align="right"
/>

"Countdown!" is a Flutter application that provides a countdown timer to help you keep track of important events or deadlines. The app allows you to create multiple countdowns, each with its own title and end date/time.

#### Usage

Tap the plus icon and enter the name and date of the event you want to create. You can create as many events as you want.

#### Features

- Create multiple countdowns
- Customizable countdown titles
- Set an end date and time for each countdown
- Countdown displays days, hours, minutes, and seconds

#### Dependencies

- `flutter_countdown_timer`


## License

Distributed under the MIT License. See LICENSE.txt for more information.

## Acknowledgements

Besides this repository, there are many other resources available to improve your Flutter skills including the official resources. Here are some of these resources that worth mentioning:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
