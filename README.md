Santo Studio Code: Neovim Configuration
Welcome to Santo Studio Code, a customized Neovim configuration designed for an efficient and visually appealing development environment. Powered by the snacks.nvim plugin, this setup provides a sleek dashboard, file exploration, and session management tailored for productivity.
Features

Custom Dashboard: A clean, centered dashboard with quick access to file exploration, recent files, project grep, configuration editing, session restoration, plugin management, and more.
Telescope Integration: Fast file searching and project navigation using telescope.nvim.
Session Management: Restore your workspace effortlessly with the persistence plugin.
Minimalist UI: Custom icons, highlights, and a distraction-free interface with a modern color scheme.
Extensible: Easily customizable for additional plugins and workflows.

Prerequisites
Before installing this configuration, ensure you have the following installed:
For All Platforms

Neovim: Version 0.9.0 or higher. Check with nvim --version.
Git: For cloning the repository and managing plugins. Check with git --version.
Ripgrep: For fast searching with Telescope. Check with rg --version.
A Nerd Font: For proper icon rendering (e.g., JetBrains Mono Nerd Font). Download from Nerd Fonts and set it in your terminal emulator.

Additional Requirements for Windows

PowerShell: Required for certain terminal-based features. Ensure you have PowerShell 5.1 or higher (included in Windows 10/11). Check with powershell -Version.
MSYS2 or Git Bash: Recommended for a Unix-like environment to run Git and other CLI tools. Install MSYS2 from msys2.org or Git for Windows from git-scm.com.
Ripgrep Installation on Windows:
Download the latest Ripgrep binary from GitHub Releases.
Extract the rg.exe file and add it to your system PATH (e.g., place it in C:\Program Files\ripgrep and update PATH in Environment Variables).
Alternatively, install via Scoop: scoop install ripgrep.


Neovim Setup on Windows:
Download the Neovim Windows binary from Neovim Releases.
Extract it to a directory (e.g., C:\Neovim) and add the bin folder to your system PATH.
Alternatively, install via Winget: winget install Neovim.Neovim or Scoop: scoop install neovim.


Terminal Emulator: Use a terminal that supports Nerd Fonts, such as Windows Terminal (pre-installed on Windows 11) or Cmder. Configure it to use your installed Nerd Font.

Installation
Follow these steps to set up the configuration on your system.
1. Backup Your Existing Configuration
Before proceeding, back up your current Neovim configuration to avoid losing your settings:
On Windows:
Move-Item -Path $HOME\AppData\Local\nvim -Destination $HOME\AppData\Local\nvim.bak

On Linux/MacOS:
mv ~/.config/nvim ~/.config/nvim.bak

2. Clone the Repository
Clone this configuration into the Neovim configuration directory:
On Windows:
git clone https://github.com/susantosanto/nvim-v2.git $HOME\AppData\Local\nvim

On Linux/MacOS:
git clone https://github.com/susantosanto/nvim-v2.git ~/.config/nvim

Replace your-username with your actual GitHub username if you host this configuration in your own repository.
3. Install Dependencies
This configuration relies on the following plugins:

folke/snacks.nvim: Core plugin for the dashboard and UI enhancements.
nvim-tree/nvim-web-devicons: For file and folder icons.
nvim-telescope/telescope.nvim: For fuzzy finding and project navigation.
folke/persistence.nvim: For session management (optional).
folke/lazy.nvim: For plugin management (optional).

To install these, open Neovim and run:
nvim
:Lazy sync

This will install all required plugins using the lazy.nvim plugin manager.
4. Verify Installation
After plugins are installed, restart Neovim and open the dashboard:
nvim

You should see the Santo Studio Code dashboard with options like:

Explore Files (f): Browse files with Telescope.
Create File (n): Open a new file in insert mode.
Recent Files (r): View recently opened files.
Grep Project (g): Search through project files.
Edit Config (c): Access Neovim configuration files.
Restore Session (s): Reload your last session.
Manage Plugins (l): Open the Lazy.nvim interface.
Exit (q): Quit Neovim.

Usage

Open the Dashboard: Press <leader>dd (default: \dd) to show the dashboard at any time.
Navigate the Dashboard: Use the keybindings listed (e.g., f, n, r) to perform actions.
Customize: Edit the configuration in ~/.config/nvim/lua/plugins/snacks.lua (or $HOME\AppData\Local\nvim\lua\plugins\snacks.lua on Windows) to tweak the dashboard, icons, or keybindings.

Configuration Details
The configuration is located in lua/plugins/snacks.lua. Key highlights include:

Dashboard Layout: Centered with a width of 50 columns, featuring a custom header and footer.
Icons and Highlights: Uses a modern color scheme with highlights like SnacksDashboardIcon (#6ab0f3) and SnacksDashboardKey (#ff8f88).
Telescope Settings: Configured to ignore .git/ and node_modules/ for faster searches.
Notifier: Minimal top-right notifications with a 1-second timeout.
UI Enhancements: Borderless windows and custom icons for folders (󰪶) and files (󰈤).

Customization
To modify the dashboard or add new features:

Open the configuration file:
On Windows:
nvim $HOME\AppData\Local\nvim\lua\plugins\snacks.lua

On Linux/MacOS:
nvim ~/.config/nvim/lua/plugins/snacks.lua


Adjust the opts table under snacks.nvim to change:

Dashboard sections, keys, or icons.
Highlight colors or UI settings.
Keybindings under the keys table.


Reload Neovim or run :Lazy sync to apply changes.


Troubleshooting

Dashboard Not Showing: Ensure snacks.nvim is installed and lazy = false in the config.
Telescope Errors: Verify ripgrep is installed and in your PATH. On Windows, check with rg --version in PowerShell or Git Bash.
Missing Icons: Install a Nerd Font and configure it in your terminal emulator (e.g., Windows Terminal or Cmder).
Plugin Issues: Run :Lazy sync to reinstall plugins or check :checkhealth for diagnostics.
Windows PATH Issues: Ensure Neovim, Ripgrep, and Git are added to your system PATH. Check with Get-Command nvim, Get-Command rg, and Get-Command git in PowerShell.

Contributing
Feel free to fork this repository and submit pull requests for improvements. Suggestions for new dashboard features or UI enhancements are welcome!
License
This configuration is licensed under the MIT License. See the LICENSE file for details.

Built with ❤️ by Tife and Fuad - Next Millionaires!
