# Rails 8 template

This is a Rails version 8 template setup for development in [dev containers](https://code.visualstudio.com/docs/devcontainers/containers).

## Setup

To start working you first need to create a new repository from this template. If you have the [dev containers](https://code.visualstudio.com/docs/devcontainers/containers) extension already installed in VSCode you can open the command palette using Ctrl+Shift+P. Then you can execute the command "Dev Containers: Clone Repository in Container Volume...". You will need to supply the repository URL in the next dialog window.
If you encounter an error related to the workspace not being found click select workspace and use the directory /workspace. Once the container is spun up you need to execute `npm install` and `bin/rails db:setup`. Make sure you are in the Rails root directory.

## Testing

For system tests there is a separate container in compose which starts a selenium chromedriver. Capybara will automatically connect to the container and execute the tests there. System tests also work with Github CI.
