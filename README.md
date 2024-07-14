# OriginOracle: Name Nationality Predictor

OriginOracle is a Flutter application that predicts the likely nationalities associated with a given name. This README explains how the application works.

## How OriginOracle Works

### 1. User Authentication

- Users start at a splash screen, which leads to a login page.
- New users can sign up with email/password or use Google/Apple sign-in.
- Existing users can log in using their credentials or social accounts.
- Firebase Authentication handles the user accounts and sessions.

### 2. Dashboard

- After authentication, users land on a dashboard.
- The dashboard provides an overview of the app's features:
  - Global Insights
  - Probability Analysis
  - Search History (planned feature)
- A "Start Predicting" button leads to the main prediction screen.

### 3. Name Input and Prediction

- On the prediction screen, users enter a name into a text field.
- Tapping the "Predict" button triggers the prediction process.

### 4. API Integration

- The app sends the entered name to the Nationalize.io API.
- API endpoint: `https://api.nationalize.io/?name={entered_name}`
- The API returns a JSON response with nationality predictions.

### 5. Data Processing

- The app parses the JSON response from the API.
- It extracts the list of predicted countries and their probabilities.

### 6. Results Display

- The app displays the prediction results in a scrollable list.
- Each list item shows:
  - The country code (e.g., "US", "GB", "FR")
  - The probability percentage for that country

### 7. Error Handling

- If the API request fails, the app displays an error message.
- Invalid inputs or network issues are communicated to the user via SnackBar notifications.

## Technical Details

- **State Management**: The app uses StatefulWidget for managing local state.
- **API Requests**: HTTP requests are made using the `http` package.
- **Authentication**: Firebase Authentication is used for user management.
- **UI**: The app uses Material Design with custom styling for an engaging user experience.

## Planned Features

- Search history to keep track of past predictions
- Detailed country information for each prediction
- Ability to share results
- Dark mode toggle

## Data Privacy

- OriginOracle does not store the names entered for predictions.
- User authentication data is managed securely through Firebase.
- API requests are made over HTTPS for data security.

## Limitations

- Predictions are based on statistical data and may not always reflect an individual's actual nationality.
- The accuracy of predictions can vary depending on the uniqueness and global distribution of the name.

## Feedback and Contributions

We welcome feedback and contributions to improve OriginOracle. Please submit issues or pull requests through our GitHub repository.