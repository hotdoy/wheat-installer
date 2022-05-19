# wheat-installer

The Wheat installer is a bash script that installs the [Grav Admin](https://getgrav.org/downloads) package and the [Wheat starter](https://getwheat.ca/) theme and then symlinks everything together ready for your next project.

## Requirements

- This should only be used when starting a NEW project (for now).
- If you are using Windows, you'll need something like Git Bash to run the script.
- Make sure you don't use any backslash when sending commands to the installer.

## Instruction

- Find a cool name for your project. The name should be made of only one word, in lowercase (eg: mycoolproject).
- Create a new empty folder and name it with the aforementioned name.
- Drop `wheat.sh` in there.
- Run the script using Git Bash (Windows) or Terminal (MacOs) or simply by double clicking on it.
- Follow the instructions.
- When finished, your Grav project should run at something like `127.0.0.1/mycoolproject`.
- You can safely delete the script.
- Create a new repo from the `grav-theme-mycooltheme` folder.
- Publish your `main` branch.
- Create a new `develop` branch and publish it.
- You should only ever work in the `develop` branch as of now.
