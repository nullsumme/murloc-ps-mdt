<!-- Source: https://docs.nilname.com/Blog/How_to_setup_NilName/ -->

# How to use NilName

 

Most likely you aren't here for just NilName, you most likely have a Lua framework that happens to support NilName, and you are looking to set this up correctly.

 

Regardless of what brings you here, this guide will shine some light on what a generic setup looks like.

 

## How To

 

- [Obtain a NilName License](https://docs.nilname.com/Blog/How_to_setup_NilName/#obtain-a-nilname-license) 
- [Download NilName](https://docs.nilname.com/Blog/How_to_setup_NilName/#download-nilname) 
- [Setup NilName](https://docs.nilname.com/Blog/How_to_setup_NilName/#setup-nilname) 
- [Download MMAPS (Optional)](https://docs.nilname.com/Blog/How_to_setup_NilName/#download-mmaps-optional) 
- [Setup NnNav (Optional)](https://docs.nilname.com/Blog/How_to_setup_NilName/#setup-nnnav-optional) 
- [Setup Auto Relogging (Optional)](https://docs.nilname.com/Blog/How_to_setup_NilName/#setup-auto-relogging-optional) 
- [Download and install third-party Lua framework](https://docs.nilname.com/Blog/How_to_setup_NilName/#download-and-install-third-party-lua-framework) 
- [Profit 🚀](https://docs.nilname.com/Blog/How_to_setup_NilName/#profit)

 

### Obtain a NilName License

 

Visit [nilname.com/account](https://nilname.com/account) to register/login and purchase your license. We only accept Litecoin & Bitcoin at the time of writing, but you might want to look into our [NilName Partners](https://nilname.com/partners) to find a third-party offering different payment options.

 

When logged into NilName, make sure to purchase the 'advanced unlocker' license. After purchase, the key, along with it's details, will be listed in the Account overview. We will need this license key in the next step.

 

### Download NilName

 

You can download NilName from [here](https://cdn.nilname.com/NoName.zip).

 

Extract these files in a directory where no special characters are present *(only ASCII chars)*. E.g. extract all into ` C:\Nn `. *(lets refer to this as 'the Nn folder')*

 

Open your Nn folder and write your Nn License Key into ` license.txt `. *(this will be used later)*

 

### Setup NilName

 

The NilName Launcher is the ` NoName.exe ` file that is located in your Nn folder. By default, double clicking this file will read ` license.txt ` for your license key, and then waits for you to start game. *(if you have not already updated ` license.txt `, do it now)*

 

We offer some more complex setups as well:

 

- Let NilName Launch game for you 
- Launch multiple instances at once 
- Provide extra obscuring of launcher

 

We won't go into any details for these as they are explained at [the home page](https://docs.nilname.com/#advanced).

 

### Download MMAPS *(Optional)*

 

To have a working navigation system, you will need to download pre-calculated mesh files. These files are pretty large, but are only needed in case you wish to perform complex movement calculations *(required by all advanced bots)*.

 

These optional files are needed for all versions of game:

 

- [Classic Era](https://cdn.nilname.com/mmaps/classic_era.7z) -> "classic_era" 
- [Classic](https://cdn.nilname.com/mmaps/classic.7z) -> "classic" 
- [Retail](https://cdn.nilname.com/mmaps/retail.7z) -> "retail"

 

These files must be moved into your Nn folder, at ` mmaps\NAME `. For example, if your Nn folder is ` C:\Nn ` and you want Retail, your files must be extracted into ` C:\Nn\mmaps\retail\ `. *(Verify that the ` retail ` folder only contains ` .mmap ` and ` .mmtile ` files, no new folder!)*

 

### Setup NnNav *(Optional)*

 

If you need NnNav and you have download the MMAPs, you can now launch a **single instance** of the NnNav tool. You must **run NnNav as admin and keep it open** at all times while game is running.

 

If not, you may run into 'error(7)' and heavy lag.

 

### Setup Auto Relogging *(Optional)*

 

For those who need, you can use the relogging script to auto log back in.

 

This script can be found in ` load_glue ` in your Nn folder. By default, there are two files, ` reloggerV7.lua ` and ` account_data.json `.

 

You only need to open ` account_data.json ` and modify it, it looks something like this:

 

```json
{
  "enabled": true,
  "logging": true,
  "username": "kmoynihan@gmail.com",
  "password": "BabySharkD0DoDOd0",
  "account": "mom2",
  "realmName": "Lone Wolf",
  "maxAttempts": 6,
  "waitBeforeEntering": 9,
  "playerSlot": 1
}
```

 

You want to modify the following fields: - ` username `, email - ` password `, password - ` account `, account name - ` realmName `, realmName - ` maxAttempts `, max attempts to try logging in - ` waitBeforeEntering `, seconds before entering - ` playerSlot `, the index of your characters for the given realm

 

Please note that you do not want to spam login for hours on end. This might happen *(unwanted)* due to game server maintenance, resulting in unhuman-like activity.

 

### Download and install third-party Lua framework

 

There is another folder in your Nn folder, named ` scripts `. Any ` .lua ` or ` .nn ` file place in here can be loaded in the world using ` /nn load filename `. Any of these files starting with ` _ ` will be auto-loaded upon entering the world.

 

### Profit

 

Yes
