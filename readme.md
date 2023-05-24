PowerShell script that generates and copies standard messages for various scenarios based on user input. The script allows users to select options by entering corresponding numbers to generate specific messages.

Here's a breakdown of the script's functionality:

The script defines a function called Last_reboot() that retrieves the last boot-up time of the Windows operating system.

The script sets the console window size to 60 columns and 23 lines.

The script checks the arguments passed to it. If arguments are provided, 
it determines which options to enable based on the arguments' values.

If no arguments are provided, the script presents a menu of standard message options and prompts the user to choose an option by entering a number.

Based on the user's selection or provided arguments, the script sets corresponding variables ($info, $inc, $memory, etc.) to True.

Using conditional statements (if, elseif), the script checks the enabled options and generates specific messages accordingly. Each message is copied to the clipboard using the clip command.

The generated messages include information for scenarios such as requesting more information, 
acknowledging non-incidents, memory issues, SIEM issues, CPU usage, modem flapping, admin password, high CPU usage, modem checks, ISP changes, NTP daemon, changes, 
no traffic observed, Microsoft Teams out-of-office message, Palo Alto memory/CPU issues, and marketing changes.

After generating and copying the selected message, the script prompts the user if they want to quit. If the user enters 'Q' or 'q', the script exits.
Otherwise, the script restarts, clearing the console and presenting the menu or waiting for arguments.

It's worth noting that some parts of the script contain placeholder values (e.g., <xx>, <CHANGE REF>, <ENGINEER NAME>)
that would need to be replaced with actual values relevant to your environment.

Please let me know if you need further a
