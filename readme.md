# TDT4165 Course repo

## QoL script
Source the script when working on tasks or add its contents to your zshrc.<br>
Assumes Oz is installed as directed by the course description:<br>
Run the command ```brew tap dskecse/tap``` in the terminal.<br>
Run the command ```brew install --cask mozart2``` in the terminal.<br>
### Using the script
Run ```oz var``` in a directory containing your .oz source files.<br>
The script will try to find a source file matching the "var" then compile and run it using the Oz emulator<br>
For example, in a folder containg the file "task1.oz", running ```oz 1``` should find, compile and run the source file<br>
