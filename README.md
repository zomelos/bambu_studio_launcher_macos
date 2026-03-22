#  Bambu Studio Launcher for MacOS

This tool lets you start Bambu Studio and make sure that your 3D printer will turn on together with the app.
No need to launch another app and click on buttons to turn on your printer.

## Requirements

1. MacOS
1. [Bambu Studio](https://bambulab.com/en/download/studio)
1. a 3D printer with a smart power plug controlled power
1. [Home Assistant](https://www.home-assistant.io/)

## Installation

### 1. Set-up a long lived access token for your user in Home Assistant:
  * Go to your Home Assistant instance app / www
  * Click on your user icon in the sidebar
  * Go to security tab
  * Scroll down to "Long lived access tokens"
  * Generate a new one: give it a name e.g. "MacOS Token"
  * Copy the generated token to clipboard
  * Open Terminal app and run this command to securely save your token (replace `<YOUR_TOKEN>` with your token value)
```
security add-generic-password -a $USER -s "homeassistant_auth_token" -w "<YOUR_TOKEN>" -U
```

### 2. Set some env variables so the launcher script knows where your Home Assistant is and which entity controls your printer's power socker
 
Set your Home Assisntant URL (replace the URL with your instance's URL):

``` 
echo 'export HASS_BASE_URL="http://homeassistant.local"' >> ~/.zshrc
```

Set your printer's power outlet controlling entity (replace entity ID with your own one):

```
echo 'export HASS_SWITCH_ENTITY_ID="switch.smart_plug_example_entity"' >> ~/.zshrc
```

Reload environment:

```
source ~/.zshrc
```

### 3. Make sure that the script is executable

Open Terminal app and run:

```
cd <your script directory>
chmod +x bambuStudio.sh
```

### 4. Start using bambuStudio.sh to launch Bambu Studio instead of launching an app

To launch Bambu Studio and turn on your printer in the background:

* Open Terminal app
* Run launcher script

```
cd <your script directory>
./bambuStudio.sh
```