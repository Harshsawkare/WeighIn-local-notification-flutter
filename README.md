# WeighIn - Flutter Weight Tracker with Local Notifications, GetX, and GetStorage
This Flutter Weight Tracker project is a cross-platform mobile application that helps users keep track of their daily weight entries. The app uses local notifications to remind users to record their weight at a predefined time each day. The project incorporates Flutter for building the user interface, GetX for state management, and GetStorage as a local database solution. It is designed to work seamlessly on both Android and iOS platforms.

**Key Features:**

**1. Daily Weight Tracking:**

Users can log their weight daily, and the app displays a scrollable list of recorded weights.
The list also shows any missed days where the user did not log their weight.


**2. Local Notifications (Android and iOS):**

The app schedules local notifications to remind the user to record their weight at a specific time each day.
Users can set and update the notification time based on their preference.
The notification system is fully integrated to work with both Android and iOS, utilizing platform-specific configurations to ensure smooth operation across devices.


**3. GetX State Management:**

GetX is used for efficient and reactive state management throughout the app.
The app utilizes GetXController for managing the application’s data flow and user interactions, ensuring a responsive and lightweight experience.
State updates, such as logging weight entries or updating notification times, are handled with GetX's reactive programming, allowing for real-time UI updates.


**4. Local Database with GetStorage:**

The app uses GetStorage as a local, lightweight database to store user data persistently.
GetStorage provides a simple and fast solution for saving the user's name, daily weight logs, and notification settings directly on the device.
Data stored using GetStorage persists between app sessions, ensuring that users' weight entries and preferences are not lost even after the app is closed or restarted.


**5. Cross-Platform Support:**

Built using Flutter, this project is fully functional on both Android and iOS platforms, ensuring consistent user experience across devices.
The notification system is carefully tailored to work with FlutterLocalNotificationsPlugin, ensuring smooth notification handling on both operating systems.


**Technical Highlights:**

**Flutter:** Leveraging Flutter’s cross-platform capabilities to build a single codebase that runs on both Android and iOS.

**Local Notifications:** Implemented using FlutterLocalNotificationsPlugin for sending platform-specific notifications.

**GetX:** The app uses GetX for state management, reducing boilerplate code while maintaining clear and efficient data handling across the app.

**GetStorage:** A persistent storage solution is provided through GetStorage, allowing fast, key-value pair storage without the complexity of larger databases like SQLite.


**Potential Use Cases:**

**Personal Fitness:** Users aiming to track their daily weight as part of a fitness journey.

**Health Monitoring:** Individuals monitoring weight changes for health reasons, such as managing weight loss, weight gain, or other medical conditions.

**Reminder App:** A great example of how Flutter can be used to implement a reminder system with local notifications, adaptable to other use cases like medication tracking or habit formation.


This project showcases the integration of Flutter's local notifications, state management using GetX, and local storage with GetStorage, creating a smooth and user-friendly experience for daily tracking and reminders.
