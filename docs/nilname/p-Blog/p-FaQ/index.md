<!-- Source: https://docs.nilname.com/Blog/FaQ/ -->

# FaQ

 

- [Does 'add session' add time?](https://docs.nilname.com/Blog/FaQ/#does-add-session-add-time) 
- [Please elaborate on 'not extend the expiration date [...] It only adds time'](https://docs.nilname.com/Blog/FaQ/#please-elaborate-on-not-extend-the-expiration-date-it-only-adds-time) 
- [Why does NnNav say 'DLL not found'?](https://docs.nilname.com/Blog/FaQ/#why-does-nnnav-say-dll-not-found) 
- [Why do I get NnNav 'error(7)' in chat?](https://docs.nilname.com/Blog/FaQ/#why-do-i-get-nnnav-error7-in-chat) 
- [What is the best way of setting up NnNav with VMs?](https://docs.nilname.com/Blog/FaQ/#what-is-the-best-way-of-setting-up-nnnav-with-vms)

 

## Does 'add session' add time?

 

**No**, adding a session does not extend the expiration date of the entire token. It only adds time to the newly added sessions. The expiration date of each session is independent, so if you have multiple sessions, you can use them in parallel timing, effectively 'doubling' the time if used concurrently.

 

## Please elaborate on 'not extend the expiration date [...] It only adds time'

 

Think of your license token as a collection of parallel timelines, and each session is like a distinct timeline within this multiverse. When you initially purchase a token, you have one timeline *(session)* available, and it runs its course for a certain duration, let's say 30 days.

 

Now, imagine that each timeline has its own clock, ticking away independently. If you decide to add another session, it's like branching off a new parallel timeline. However, the interesting twist is that these timelines don't sync up in terms of expiration. Instead, the new session gets its own 'clock,' and the cost is adjusted based on the time left in that specific timeline.

 

So, if your original timeline is already halfway through its journey, adding a new session essentially creates a fresh parallel timeline, but with only half the original timeline's duration *(costing half the price)*. Now you have two parallel timelines, both ticking away independently, and if used concurrently, it's like experiencing a 'doubled' effect.

 

TL;DR adding a **session doesn't extend the expiration** of the entire token, but **it creates a new parallel timeline** with its own duration.

 

## Why does NnNav say 'DLL not found'?

 

You might miss some important stuff, try downloading it from the [official Microsoft website](https://aka.ms/vs/17/release/vc_redist.x64.exe).

 

## Why do I get NnNav 'error(7)' in chat?

 

Most likely you did not run the NnNav server. Maybe it has died? Maybe it is blocking?

 

## What is the best way of setting up NnNav with VMs?

 

We have some Lua API's that can be used to configured the path generation API.

 

When using a VM setup, you have two groups of devices: - The HOST machine, who runs the VM's - The GUEST machine, who runs your game clients.

 

Traditionaly, one launched NnNav *(as Admin)* on the computer that runs WoW. But for a VM based setup, this can be optimized to reduce resource consumption.

 

Ideally, you want to create a ` /scripts/_config.lua ` in the Nn folder of each GUEST machine that runs the game client. In each of these lua files you write the following lua code, assuming that ` 192.168.1.1 ` is your HOST machine.

 

```lua
SetNavHost("192.168.1.1") -- where 192.168.1.1 is your HOST machine
```

 

Please make sure you have a special network routing configured in your VM software and make sure that port ` 9910 ` of the HOST is reachable. *(Please do not reach out for support if you fail this step, this is for advanced users only 🙃)*
