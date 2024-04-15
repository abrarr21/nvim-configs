Neovim Configuration for Beginners

Welcome to this repository containing Neovim (nvim) configurations tailored for beginners. This setup aims to provide a starting point for those new to Neovim, offering a clean and comprehensible configuration.
Getting Started
Prerequisites

Before using this Neovim configuration, ensure you have the following installed on your system.

Installation

To use this configuration:

Clone this repository to your local machine:

bash

    git clone <repository_url>

Navigate into the cloned directory:

bash

    cd nvim-config-beginner

Copy the configuration files to your Neovim configuration directory (~/.config/nvim/):

bash

    cp -r * ~/.config/nvim/

Features

    Minimalist Setup: The configuration is kept simple and beginner-friendly.
    Key Plugins Included: Essential plugins like vim-plug are included to enhance your Neovim experience.
    Basic Key Bindings: Common key bindings are set up to get you started.


Usage

Once installed, open Neovim by typing nvim in your terminal. You should see the plugins automatically installing on the first launch (thanks to vim-plug). If any plugins fail to install, run :PlugInstall within Neovim.

Feel free to customize and expand upon this configuration to suit your needs as you become more familiar with Neovim.