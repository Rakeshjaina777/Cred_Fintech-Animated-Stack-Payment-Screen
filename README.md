# cred_assignment

A new Flutter project implementing a stack view abstraction layer with expanded and collapsed states, designed for dynamic and interactive UI experiences.

As this is an  Cred assignment, some files have been deleted to prevent copying. If any recruiter wants to run this, please contact me at rakeshjaina777@gmail.com.


---

<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/c7b6acc8-ca82-483b-9452-60fd3998e8cb" alt="Screenshot 2" height="550"></td>
      <td><img src="https://github.com/user-attachments/assets/407e49a4-7064-43a9-8838-a07a1488db71" alt="Screenshot 1" height="550"></td>
      <td><img src="https://github.com/user-attachments/assets/881408ce-8b4a-45df-a41e-dfb948277971" alt="Screenshot 3" height="550"></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/75a912a9-b2f2-42a7-bfd8-8592d13d4f15" alt="Screenshot 4" height="550"></td>
      <td><img src="https://github.com/user-attachments/assets/f54afaf3-517c-429f-8342-d6dcb6d17e7a" alt="Screenshot 5" height="550"></td>
    </tr>
  </table>
</div>

---

<div align="center">
  <p>Video Demonstrations:</p>
  <ul>
    <li><a href="https://drive.google.com/file/d/12TVWfULVjPb_m7szB0CiW2xMaXBYjTIl/view?usp=drive_link">Video 1</a></li>
    <li><a href="https://drive.google.com/file/d/14bCXbKTFHRZBBa4VXUYrcGPIa2Xeh38A/view?usp=drive_link">Video 2</a></li>
  </ul>
</div>

---

## Getting Started

This project serves as a starting point for creating stack views with the following functionalities:

1. **Dynamic States**: Each stack view supports Expanded and Collapsed states.
2. **State Toggle**: Clicking on a collapsed view expands it, and any currently expanded view collapses.
3. **Constraints**: The stack supports a minimum of 2 items and a maximum of 4 items.
4. **API Integration**: Dynamically fetch data for the views using a mock API.

---

## Key Features

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
```

---

## API Integration

The project fetches stack view data from a mock API. Update the `API_ENDPOINT` in the Model class as required:

```dart
const String API_ENDPOINT = "https://your-mock-api-url.com/data";

// Sample mock API response
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
```

---

## Folder Structure

```plaintext
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
```

---

## Customization

### View Design

To customize the appearance of the stack views:

- Edit the `CollapsedView` widget in `collapsed_view.dart`.
- Edit the `ExpandedView` widget in `expanded_view.dart`.

### Stack Constraints

Modify the minimum and maximum constraints for stack items in the Model or Controller.

---

## Resources

Here are a few resources to get you started:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [Flutter API Documentation](https://api.flutter.dev/)

---

## Contact

For questions or support, feel free to reach out:

- **Email**: [rakeshjaina777@gmail.com](mailto:rakeshjaina777@gmail.com)
- **GitHub**: [https://github.com/Rakeshjaina777](https://github.com/Rakeshjaina777)
- **LinkedIn**: [https://www.linkedin.com/in/rakesh-jain-b93b28223/](https://www.linkedin.com/in/rakesh-jain-b93b28223/)
