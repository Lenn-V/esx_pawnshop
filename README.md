#  FiveM Pawnshop Script (ESX)

A lightweight and secure pawnshop script for FiveM servers, designed to allow players to sell items for cash in a clean and immersive way. This resource focuses on **smooth client-side interactions**, while all sensitive logic (such as money handling) is processed **server-side** to prevent abuse and cheating.

---

##  Features

*  **Sell items for cash**
*  **Clean and intuitive menu system**
*  **Immersive animations during selling**
*  **Secure server-side money handling (anti-cheat friendly)**
*  **Built-in translation system (multi-language support)**
*  **Discord webhook integration for logging**
*  **Optimized and lightweight performance**
*  **Fully compatible with ESX (es_extended)**
*  **Seamless support for ox_lib & ox_inventory**

---

##   How It Works

The script is split into two main parts:

### Client-side:

* Handles **menus and UI interactions**
* Plays **animations** when selling items
* Sends sell requests to the server

### Server-side:

* Validates player inventory
* Processes item removal and cash rewards
* Sends logs to Discord via webhooks
* Ensures **secure and cheat-resistant transactions**

---

##  Dependencies

Make sure you have the following installed:

* `es_extended`
* `ox_lib`
* `ox_inventory`

---

##  Installation

1. Place the resource in your `resources` folder
2. Add the following to your `server.cfg`:

   ```
   ensure your_pawnshop_script
   ```
3. Configure the script to your needs:

   * Sellable items
   * Prices
   * Pawnshop locations
   * Webhook URL
   * Language settings

---

##    Configuration

The configuration file allows you to customize:

*  Item prices
*  Pawnshop locations
*  Language / translations
*  Discord webhook logging

---

##  Webhooks

The script includes Discord logging for:

* Sold items
* Quantities
* Total earnings
* Player information

---

##  Translations

Easily add or edit languages using the built-in translation system.

---

##  Support

If you have questions, need help, or found a bug:

 Contact on Discord: **lenny0008**

---

##  License

Free to use and modify. Credits are appreciated 

---

##  Planned Updates (Ideas)

* UI improvements
* NPC interactions
* Black market version
* Configurable animations

---

##  Credits

Made with passion for the FiveM community.

---
