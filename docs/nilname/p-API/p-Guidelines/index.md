<!-- Source: https://docs.nilname.com/API/Guidelines/ -->

# ℹ️ Guidelines

 

## ⚠️ Performance

 

Please note that NoName is a versatile framework providing fast and secure features for our Lua developers. However, the **incorrect usage of our APIs will most likely result in performance hits** with an order of magnitudes. Please pay close attention to the instructions below to avoid falling into certain pitfalls which will cost you a decrease in frame rates

 

The following API's are optimized for speed, please prefer these where possible:

 

- Object / ObjectPointer 
- GetFocus *(uses ` Object('focus') ` )* 
- GetNPCObject *( uses ` Object('npc') ` )* 
- SetFocus 
- SetNPCObject 
- ObjectType 
- ObjectExists 
- ObjectField - *(Used by nearly all Object Descriptor API)*

 

💡Despite optimization, please avoid doing ` ObjectType ` on every object and instead use ` ObjectManager(type) ` to obtain a table with objects that all have the given ` type `.

 

💡Most Object Descriptors (e.g, ` ObjectField `, ` ObjectRotation `, etc) already use the optimized ` ObjectField ` API 😊.

 

## 📃API List

 

- Cryptography - Correct usage of the cryptographic APIs 
- Filesystem - How to access the file system 
- HTTP - How to do basic HTTP requests. *(more on this for advanced users, just ask)* 
- Navigation - Detail on how the NoName navigation system works 
- Objects - Everything you need to know about ObjectManager and Object Descriptors 
- Utility - miscellaneous

 

## 📚 NoName Libraries Included

 

- JSON - ` NoName.Utils.JSON ` 
- LibDraw - ` NoName.Utils.Draw:New() ` 
- LibStub - ` NoName.Utils.LibStub ` 
- SHA/HMAC - ` NoName.Utils.sha ` 
- AES - ` NoName.Utils.AES ` 
- ACEGUI - ` NoName.Utils.AceGUI ` 
- Storage - ` NoName.Utils.Storage.read ` / ` Noname.Utils.Storage.write `
