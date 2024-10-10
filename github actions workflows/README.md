# GitHub Actions Workflow Collection

## How to Use

This collection provides GitHub Actions workflows for automating your build and test processes.

**Example: .NET + React Project**

To use these workflows with a .NET and React project, follow these steps:

1. **Copy Workflow Files:** Copy the following files into the `/.github/workflows/` directory of your repository:
   - `build-auto.yml`: Triggers the main build workflow on push or pull request to the `main` branch.
   - `build.yml`:  Defines the sequence of workflows to run.
     - `build-net.yml`: Builds and tests the .NET project.
     - `build-react.yml`: Builds and tests the React project.
2. **Trigger the Workflow:** Commit any changes to your `main` branch to trigger the workflow. This will initiate the build and test process for both the .NET and React projects.

With this setup, your project will be built and tested automatically after every commit, allowing you to quickly identify any issues.

**Adapting to Other Projects**

You can easily adapt these workflows to other project types. Keep the `build-auto.yml` file to trigger builds on commits, and then customize the `build.yml` file to specify the appropriate build and test steps for your project.