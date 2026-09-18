<!-- Source: https://docs.nilname.com/Blog/The_best_of_Nn_Basic/ -->

# The Best of Nn Basic

 

We offer two types of product, the well known Advanced Unlocker which is our main selling point, but we also hold a little *(yet versatile)* alternative, known as the Nn Basic unlocker.

 

Unlike the Advanced unlocker, the Nn Basic unlocker is not capable of movement, AoE spell casting at arbitrary XYZ, nav mesh, in-game commands, HTTP, 3D drawing, AH, etc..

 

So what does it do? Well, the one and only thing you'd expect it to do: **unlocking the Lua** protections as it removes all taint protections.

 

## What is locked Lua?

 

You see, the game offsets this infamous [CastSpellByName](https://warcraft.wiki.gg/wiki/API_CastSpellByName) and CastSpellByID Lua APIs, which are used by the game itself when certain keybinds are being triggered.

 

For obvious reasons, [game devs restricted (locked) these APIs at Patch 2.0](https://warcraft.wiki.gg/wiki/Secure_Execution_and_Tainting) as the public became more aware of how powerful said APIs could be.

 

Today, we use Nn Basic to bypass these restructions so we can now do things like ` /run CastSpellByName("Frostbolt") `.

 

## What if we used 100% of the brain?

 

![PV playing it smart](https://docs.nilname.com/assets/pv_smart.png)

 

Now that we are capable of using spellcasting APIs, we simply look at addons like [Hekili](https://github.com/Hekili/hekili), [DoMeWhen](https://github.com/fiskee/DoMeWhen-Classic) or [WeakAuras2](https://github.com/WeakAuras/WeakAuras2) to take advantage of their advanced logic of "previewing" spellcasting information.

 

You see, these legitimate AddOns are limited to displaying UI elements. So for our purpose, we are going to hook into Hekili's ` Hekili.AddToStack ` function and hook it so we call our unlocked ` CastSpellByName ` and cast some actual spells.

 

## Nn Basic with Hekili

 

To install and patch Hekili for retail, follow the below commands:

 

Open a command prompt and nagivate to your Retail Wow AddOn folder



```text
cd "C:\Program Files (x86)\World Of Warcraft\_retail_\Interface\AddOns\"
```





 

Install the latest version of Hekili into your Retail folder



```text
git clone https://github.com/Hekili/hekili.git
```





 

Navigate into the Hekili addon folder



```text
cd ./hekili
```





 

Download the ` HKPatch.lua ` file which contains the logic to add spellcasting



```text
curl https://cdn.nilname.com/HKPatch.lua -o ./HKPatch.lua
```





 

Now append the ` HKPatch.lua ` filename to the ` Hekili.toc ` file so it loads when the addon runs



```text
echo. >> Hekili.toc
echo HKPatch.lua >> Hekili.toc
```





 

## Profit

 

Enjoy your free Nn Basic along with free open-source community based AddOns.

 



 

Date: 30/08/2024
 Author: Principal Vagina
