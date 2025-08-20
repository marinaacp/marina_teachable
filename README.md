# Teachable Courses Demo

## About This Project

This project demonstrates fetching course and enrollment information from the Teachable Public API. It provides:

- A list of all published courses in your school (`ReportsController#index`), showing each course's name and heading.
- A detailed view for each course (`ReportsController#show`), listing all actively enrolled students with their names and emails.

## API Key Usage

For the purposes of this test, the API key is included directly in the initializer (`config/initializers/teachable.rb`). This ensures that the evaluator can run the project without needing to configure environment variables.

> **Important:** In a real production environment, API keys should **never** be committed to a repository. The recommended approach is to use environment variables or a secure secrets manager.

## Testing

All tests were written for the `TeachableApiService` using **MiniTest**, which is the default testing framework for Rails.

The `ReportsController` itself is not directly tested because it is a thin layer that delegates all logic to the service. Testing the service ensures that the main functionality — fetching courses and enrollments — is fully covered, and keeps tests simple and maintainable.

## How It Works

- `TeachableApiService` handles all communication with the Teachable Public API.
- `ReportsController#index` fetches and displays all courses.
- `ReportsController#show` fetches and displays enrolled students for a specific course.
