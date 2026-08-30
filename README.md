# 🎬 MovieExplorer

A sample iOS application built using **SwiftUI and MVVM architecture** to demonstrate modern iOS development concepts.

The application provides offline login and registration, movie listing, movie details, favorites management, network images, video playback, tab-based navigation, and profile/logout functionality.

## 📱 Features

### 🔐 Offline Login & Registration

* User registration without an internet connection
* User credentials stored locally
* Offline login validation
* Login state maintained using `@AppStorage`
* Logout functionality with confirmation alert

### 🎬 Movie List

* Display movies using SwiftUI `List`
* Movie poster images loaded from network
* Movie title, genre, and rating
* Custom movie card UI
* Favorite button available directly from the movie row

### ❤️ Favorites

* Add/remove movies from favorites
* Favorite state maintained using a shared `MovieViewModel`
* Dedicated Favorites tab
* Empty state displayed when there are no favorite movies

### 🎥 Movie Details

* Navigate from Movie List to Movie Detail screen
* Display movie poster
* Display movie title, genre, rating, and description
* Video/trailer play button
* Full-screen video playback using `AVKit`

### 👤 Profile

* Profile image
* Username
* Mobile number
* Profile options
* Logout functionality
* Logout confirmation popup

### 🧭 Navigation

The application uses:

* `NavigationStack`
* `NavigationLink`
* `TabView`
* Full-screen video presentation

Application flow:

```text
Login
  │
  ├── Register
  │
  └── Login Success
          │
          ▼
      MainTabView
          │
          ├── Movies
          │     │
          │     └── Movie Detail
          │             │
          │             └── Video Player
          │
          ├── Favorites
          │
          └── Profile
                │
                └── Logout
                       │
                       ▼
                    Login
```

---

# 🏗️ Architecture

The application follows the **MVVM (Model-View-ViewModel)** architecture.

```text
                 ┌─────────────────┐
                 │      View       │
                 │   SwiftUI UI    │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │   ViewModel     │
                 │  Business Logic │
                 │     State       │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │     Model       │
                 │   Movie / User  │
                 └────────┬────────┘
                          │
                          ▼
                 ┌─────────────────┐
                 │    Services     │
                 │ Local / Network │
                 └─────────────────┘
```

## 📂 Project Structure

```text
MovieExplorer
│
├── Models
│   └── Movie.swift
│
├── Views
│   ├── MovieListView.swift
│   ├── MovieRowView.swift
│   ├── MovieDetailView.swift
│   ├── FavoritesView.swift
│   ├── ProfileView.swift
│   ├── LoginView.swift
│   ├── RegisterView.swift
│   ├── HomeView.swift
│   ├── MainTabView.swift
│   ├── ProfileRow.swift
│   └── VideoPlayerScreen.swift
│
├── ViewModels
│   ├── MovieViewModel.swift
│   ├── LoginViewModel.swift
│   └── RegisterViewModel.swift
│
├── Services
│   └── UserStorageService.swift
│
└── MovieExplorerApp.swift
```

---

# 🧩 Technologies Used

* **Swift**
* **SwiftUI**
* **MVVM**
* **Async/Await**
* **NavigationStack**
* **NavigationLink**
* **TabView**
* **@StateObject**
* **@Published**
* **@EnvironmentObject**
* **@AppStorage**
* **UserDefaults**
* **AsyncImage**
* **AVKit**
* **AVPlayer**

---

# 🔑 Authentication Flow

The application uses local storage for the sample authentication flow.

User registration:

```text
Register
   │
   ▼
UserStorageService
   │
   ▼
UserDefaults
```

Login:

```text
Login
  │
  ▼
UserStorageService
  │
  ▼
Validate Credentials
  │
  ├── Invalid → Error Message
  │
  └── Valid
       │
       ▼
   isLoggedIn = true
       │
       ▼
   MainTabView
```

The login state is maintained using:

```swift
@AppStorage("isLoggedIn")
private var isLoggedIn = false
```

---

# ❤️ Favorite Movie Flow

The `MovieViewModel` maintains the movie list and favorite state.

```text
MovieListView
      │
      ▼
MovieViewModel
      │
      ├── movies
      │
      └── favoriteMovies
              │
              ▼
        FavoritesView
```

When the favorite button is tapped:

```swift
viewModel.toggleFavorite(movie: movie)
```

The UI automatically updates because the movie list is published through `@Published`.

---

# 🖼️ Network Images

Movie posters are loaded using SwiftUI's `AsyncImage`.

```swift
AsyncImage(url: URL(string: movie.imageUrl))
```

The UI handles:

* Loading state
* Successful image loading
* Failure state

---

# 🎥 Video Playback

Movie trailers/videos are played using Apple's `AVKit`.

```swift
VideoPlayer(player: player)
```

The video opens in a full-screen presentation when the user taps the play button.

```text
Movie Detail
     │
     ▼
  ▶ Play
     │
     ▼
Full Screen Video Player
```

---

# 🧭 Tab Navigation

The application uses `TabView` for the main navigation.

```text
┌─────────┬────────────┬──────────┐
│ Movies  │ Favorites  │ Profile  │
└─────────┴────────────┴──────────┘
```

Each tab maintains access to the shared `MovieViewModel` using:

```swift
.environmentObject(movieViewModel)
```

---

# 🚪 Logout

When the user selects Logout:

```text
Profile
   │
   ▼
Logout
   │
   ▼
Confirmation Alert
   │
   ├── Cancel
   │
   └── OK
        │
        ▼
   isLoggedIn = false
        │
        ▼
      Login
```

---

# 🚀 Future Enhancements

The following features can be added in future versions:

* Real movie API integration
* Search movies
* Movie categories
* Pagination
* Persistent favorite movies
* SwiftData/Core Data
* Dependency Injection
* Unit Tests
* UI Tests
* Error handling improvements
* Offline movie caching
* Profile editing
* Image picker for profile picture
* Dark mode support

---

# 🎯 Purpose of the Project

This project was created as an **iOS learning and POC application** to gain practical experience with Swift, SwiftUI, MVVM architecture, navigation, local storage, network image loading, video playback, and state management.

## 👨‍💻 Author

**Vijay Santosh Kumar**

Android & iOS Developer

---

## 📄 License

This project is created for learning and demonstration purposes.
