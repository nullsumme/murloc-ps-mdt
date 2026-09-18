<!-- Source: https://docs.nilname.com/ -->

# Nn Setup

 

## Unlocker

 

On a general note you only need to put your Nn Token inside the ` license.txt ` file found at the base directory and then run the ` NoName.exe ` before you run your client of choice.

 

You can create a ` path.txt ` file in there if you want Nn to launch the client for you but only one client can be specified



```text
C:\Program Files (x86)\World of Warcraft\_retail_\Wow.exe
```





 

## Navigation Server

 

The ` nnav.exe ` Only needs the ` mmaps ` folder beside it and can be placed on a standalone folder by itself to serve as many clients you can think of.

 

You only need to run it once and there is no need for it to be restarted on Client Restart

  

## Advanced

 

For Extra Security we advice that you run NnNav on a separate device on the network or even inside a Windows VM *( even windows 7 will do just fine to minimize resources )* and configure Navigation ` in-game ` to connect to it. **See API/Navigation**

 

The ` NoName.exe ` that is provided can be executed with additional arguments

 

` NoName Token Count "path/to/exe" `

 

- ` Token ` is your Nn Token aka ` NbAAaaaAAAaaaAAAaaa ` 
- ` Count ` is how many clients you want to launch and inject to 
- ` Path ` is the path to the executable to be launched, this is highly recommended to increase chances of injection

 

There is also a way for you to even ` rename ` your tool to whatever you like even removing the ` .exe ` file extention and just be creative by having a ` .bat ` file running everything for you

 

```bat
start sqlite.db NbAAaaaAAAaaaAAAaaa 1 "C:\Program Files (x86)\World of Warcraft\_retail_\Wow.exe"
```
