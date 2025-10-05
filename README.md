# Ober task1

A Flutter test project

## Getting Started

This project demonstrates:
- Selecting source and destination.
- Measuring Distance and Fare between them.
- Get Source and Destination addresses.

The project leverages **GetX** for state management and **Clean Architecture** .

---

## Features and Packages

### measuring distance and address 
- This feature uses Flutter with GetX for state management, flutter_map and latlong2 for map rendering and geographic calculations, and geolocator for obtaining the device’s current location.
- Distance between the selected points is calculated using latlong2 utilities, while **OSRM (Open Source Routing Machine) API with user-agent : flutter_map_app** is used to fetch the route. Reverse geocoding to get human-readable addresses is handled via HTTP requests to appropriate services. This combination ensures accurate distance measurement, route drawing, and address retrieval for pickup and drop-off points.

### State Management
- Managed with `GetX`, enabling reactive and predictable state updates .

### flutter map
- showing map to user , showing marker layer and TileLayer `flutter_map`.

### lat long
- used for geographic calculations and handling latitude/longitude points. `latlong2`.

### geolocator
- package for working with the device’s location and getting current location `geolocator`.

### http
- Dart/Flutter package for making network requests `http`.
- We could use Dio, Equatable, and Dartz packages for handling network requests, state comparison, and functional error handling, but due to a tight deadline, I preferred using the simpler http package.


---


## Value Equality & Functional Programming

- **equatable** → Simplifies value comparisons in BLoC states.
- **dartz** → Provides functional programming constructs like `Either` and `Option`.

---

## Project Structure

```
lib/
├── main.dart                  # Entry point
├── core/                      # Constants, utilities, and shared widgets
├── feature/
│   └── map_feature/
│       ├── data/              # JSON form data and models
│       ├── domain/            # Entities and repository interfaces
│       └── presentation/
│           ├── manager/       # GetX and state management
│           └── pages/         # UI screens

```

---

## Installation

Clone the repository:
```bash
git clone https://github.com/rezvanmj/ober_task1.git
cd task1
```
x
Install dependencies:
```bash
flutter pub get
```

Run the project:
```bash
flutter run
```

---
