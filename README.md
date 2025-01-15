# cred_assignment

A new Flutter project implementing a stack view abstraction layer with expanded and collapsed states, designed for dynamic and interactive UI experiences.

## Getting Started

This project is a starting point for creating stack views with the following functionalities:

1. **Dynamic States**: Each stack view supports Expanded and Collapsed states.
2. **State Toggle**: Clicking on a collapsed view expands it, and any currently expanded view collapses.
3. **Constraints**: The stack supports a minimum of 2 items and a maximum of 4 items.
4. **API Integration**: Dynamically fetch data for the views using a mock API.

### Key Features

- **Abstraction Layer**: Modular and reusable stack view framework.
- **Customizable Views**: Design your own Expanded and Collapsed views.
- **MVC Architecture**: Clean separation of concerns for maintainable code.

---

## Installation

```bash
# Clone the repository
git clone https://github.com/your-repo-name/cred_assignment.git

# Navigate to the project directory
cd cred_assignment

# Install dependencies
flutter pub get

# Run the application
flutter run


API Integration
The project fetches stack view data from a mock API. Update the API_ENDPOINT in the Model class as required:

dart
Copy code
const String API_ENDPOINT = "https://your-mock-api-url.com/data";

[
  {
    "id": 1,
    "title": "Sample Title 1",
    "description": "This is a description for item 1."
  },
  {
    "id": 2,
    "title": "Sample Title 2",
    "description": "This is a description for item 2."
  }
]


Folder Structure
plaintext
Copy code
lib/
├── controllers/
│   ├── stack_controller.dart       # Handles state and interactions
├── models/
│   ├── stack_model.dart            # Manages data and API calls
├── views/
│   ├── expanded_view.dart          # UI for expanded state
│   ├── collapsed_view.dart         # UI for collapsed state
│   ├── stack_view.dart             # Main stack view widget
├── main.dart                       # Entry point


Customization
View Design
To customize the appearance of the stack views:

Edit the CollapsedView widget in collapsed_view.dart.
Edit the ExpandedView widget in expanded_view.dart.
Stack Constraints
Modify the minimum and maximum constraints for stack items in the Model or Controller.


Resources
A few resources to get you started:

Lab: Write your first Flutter app
Cookbook: Useful Flutter samples
Flutter API Documentation
Contact
For questions or support, feel free to reach out:

Email: rakeshjaina777@gmail.com
GitHub: https://github.com/Rakeshjaina777
LinkedIn: https://www.linkedin.com/in/rakesh-jain-b93b28223/

