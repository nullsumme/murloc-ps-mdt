# AbstractFramework source inventory

Pinned revision: `6b2b2fedd8c27cc85370cb78991d32cb2a1c380f`.

92 tracked Lua/XML files; 109 TOC entries; 924 AF/mixin function declarations; 278 media assets.

This is an inventory, **not implemented coverage**. See [the feature matrix](features.md).

Static declarations/assignments are candidates. Dynamic exports, mixin inheritance, callback contracts and external library APIs still need behavioral audits.

## TOC and dependencies

| Source | Enabled | Client condition | In checkout |
| --- | --- | --- | --- |
| `Libs/utf8.lua` | yes | all | yes |
| `Libs/LibStub/LibStub.lua` | yes | all | external / absent |
| `Libs/CallbackHandler-1.0/CallbackHandler-1.0.lua` | yes | all | external / absent |
| `Libs/base64.lua` | yes | all | yes |
| `Libs/json.lua` | yes | all | yes |
| `Libs/md5.lua` | yes | all | yes |
| `Libs/sha256.lua` | yes | all | yes |
| `Libs/qrcode.lua` | yes | all | yes |
| `Libs/FAIAP.lua` | yes | all | yes |
| `Libs/TaintLess/TaintLess.xml` | yes | all | external / absent |
| `Libs/LibSharedMedia-3.0/lib.xml` | yes | all | external / absent |
| `Libs/LibCustomGlow-1.0/LibCustomGlow-1.0.xml` | yes | all | external / absent |
| `Libs/AceComm-3.0/AceComm-3.0.xml` | yes | all | external / absent |
| `Libs/LibSerialize/lib.xml` | yes | all | external / absent |
| `Libs/LibDeflate/lib.xml` | yes | all | external / absent |
| `Libs/LibDataBroker-1.1/LibDataBroker-1.1.lua` | yes | all | external / absent |
| `Libs/LibDBIcon-1.0/lib.xml` | yes | all | external / absent |
| `Init.lua` | yes | all | yes |
| `Locales/enUS.lua` | yes | all | yes |
| `Locales/zhCN.lua` | yes | all | yes |
| `Locales/zhTW.lua` | yes | all | yes |
| `Locales/deDE.lua` | yes | all | yes |
| `Locales/esES.lua` | yes | all | yes |
| `Locales/esMX.lua` | yes | all | yes |
| `Locales/frFR.lua` | yes | all | yes |
| `Locales/itIT.lua` | yes | all | yes |
| `Locales/koKR.lua` | yes | all | yes |
| `Locales/ptBR.lua` | yes | all | yes |
| `Locales/ruRU.lua` | yes | all | yes |
| `Locales/Post.lua` | yes | all | yes |
| `Data/ObjectPool.lua` | yes | all | yes |
| `Data/Queue.lua` | yes | all | yes |
| `Utils/Math.lua` | yes | all | yes |
| `Utils/Table.lua` | yes | all | yes |
| `Utils/String.lua` | yes | all | yes |
| `Utils/DateTime.lua` | yes | all | yes |
| `Utils/Delay.lua` | yes | all | yes |
| `Utils/Serialization.lua` | yes | all | yes |
| `Utils/Color.lua` | yes | all | yes |
| `Utils/Curve.lua` | yes | all | yes |
| `System/Addon.lua` | yes | all | yes |
| `System/CallbackHandler.lua` | yes | all | yes |
| `System/EventHandler.lua` | yes | all | yes |
| `System/Communication.lua` | yes | all | yes |
| `System/Hooks.lua` | yes | all | yes |
| `System/Scripts.lua` | yes | all | yes |
| `Executors/OnUpdateExecutor.lua` | yes | all | yes |
| `Executors/ItemLoadExecutor.lua` | yes | all | yes |
| `Utils/PixelUtil.lua` | yes | all | yes |
| `Utils/AsyncLoaders.lua` | yes | all | yes |
| `Units/Player.lua` | yes | all | yes |
| `Media/Media.lua` | yes | all | yes |
| `Media/SharedMedia.lua` | yes | all | yes |
| `Widgets/Color.lua` | yes | all | yes |
| `Widgets/Texture.lua` | yes | all | yes |
| `Widgets/Font.lua` | yes | all | yes |
| `Widgets/Animation.lua` | yes | all | yes |
| `Widgets/Base.lua` | yes | all | yes |
| `Widgets/Frame.lua` | yes | all | yes |
| `Widgets/Scroll.lua` | yes | all | yes |
| `Widgets/Glow.lua` | yes | all | yes |
| `Widgets/TooltipTemplate.xml` | yes | AllowLoadGameType mainline | yes |
| `Widgets/TooltipTemplate_Classic.xml` | yes | AllowLoadGameType classic | yes |
| `Widgets/Tooltip.lua` | yes | all | yes |
| `Widgets/Mover.lua` | yes | all | yes |
| `Widgets/FontString.lua` | yes | all | yes |
| `Widgets/Button.lua` | yes | all | yes |
| `Widgets/EditBox.lua` | yes | all | yes |
| `Widgets/Slider.lua` | yes | all | yes |
| `Widgets/SmoothStatusBarMixin.lua` | yes | all | yes |
| `Widgets/StatusBar.lua` | yes | all | yes |
| `Widgets/Dropdown.lua` | yes | all | yes |
| `Widgets/CascadingMenu.lua` | yes | all | yes |
| `Widgets/ColorPicker.lua` | yes | all | yes |
| `Widgets/Dialog.lua` | yes | all | yes |
| `Widgets/Popup.lua` | yes | all | yes |
| `Widgets/Calendar.lua` | yes | all | yes |
| `Widgets/Sheet.lua` | yes | all | yes |
| `Widgets/HelpTip.lua` | yes | all | yes |
| `Widgets/Misc.lua` | yes | all | yes |
| `Widgets/DataBroker.lua` | yes | all | yes |
| `Widgets/DragSorter.lua` | yes | all | yes |
| `Widgets/ImageViewer.lua` | yes | all | yes |
| `Widgets/ImagePane.lua` | yes | all | yes |
| `Widgets/TimeFormat.lua` | yes | all | yes |
| `Media/Glyphs.lua` | yes | all | yes |
| `Units/Common.lua` | yes | all | yes |
| `Units/Class.lua` | yes | all | yes |
| `Units/RangeCheck.lua` | yes | all | yes |
| `Units/ItemLevel.lua` | yes | all | yes |
| `Units/StatusTimer.lua` | yes | all | yes |
| `Spells/Common.lua` | yes | all | yes |
| `Spells/Bleeds.lua` | yes | all | yes |
| `Spells/CrowdControls.lua` | yes | all | yes |
| `Spells/Dispellables.lua` | yes | AllowLoadGameType mainline | yes |
| `Spells/Dispellables_Mists.lua` | yes | AllowLoadGameType mists | yes |
| `Spells/Interrupts.lua` | yes | all | yes |
| `Spells/Dispels.lua` | no | AllowLoadGameType mainline | external / absent |
| `Spells/Casts.lua` | no | all | external / absent |
| `System/Events.lua` | yes | all | yes |
| `Widgets_UnitFrames/AuraCooldown.xml` | no | all | external / absent |
| `Widgets_UnitFrames/Aura.lua` | no | all | external / absent |
| `Widgets_UnitFrames/SecretHealthBar.lua` | no | AllowLoadGameType mainline | external / absent |
| `Widgets_UnitFrames/SecretPowerBar.lua` | no | AllowLoadGameType mainline | external / absent |
| `Widgets_UnitFrames/SecretCastBar.lua` | no | AllowLoadGameType mainline | external / absent |
| `Widgets_UnitFrames/SecretNameText.lua` | no | AllowLoadGameType mainline | external / absent |
| `Widgets_UnitFrames/SecretHealthText.lua` | no | AllowLoadGameType mainline | external / absent |
| `Widgets_UnitFrames/SecretPowerText.lua` | no | AllowLoadGameType mainline | external / absent |
| `Demo.lua` | yes | all | yes |

## Source declarations

AF exports, named AF mixin methods and direct assignments are listed. Private helpers are omitted.

### [.unused/Atlas.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/.unused/Atlas.lua)

TOC: disabled or not directly listed.

- `AF.SetAtlas(texture, name)` — line 23

### [.unused/Aura.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/.unused/Aura.lua)

TOC: disabled or not directly listed.

- `AF.ReCalcTexCoordForAura(aura, width, height)` — line 11
- `AF.SetAuraCooldown(aura, start, duration, count, icon, auraType, desaturated, glow, r, g, b, a)` — line 133
- `AF.SetAuraDesaturated(aura, desaturated)` — line 187
- `AF.SetupAuraStackText(aura, config)` — line 194
- `AF.SetupAuraDurationText(aura, config)` — line 204
- `AF_AuraButtonMixin:SetCooldownStyle(style)` — line 335
- `AF_AuraButtonMixin:SetCooldown(start, duration, count, icon, auraType, desaturated, glow, r, g, b, a)` — line 373
- `AF_AuraButtonMixin:EnableTooltip(config, isHelpful)` — line 405
- `AF_AuraButtonMixin:SetDesaturated(desaturated)` — line 422
- `AF_AuraButtonMixin:SetupStackText(config)` — line 430
- `AF_AuraButtonMixin:SetupDurationText(config)` — line 438
- `AF_AuraButtonMixin:UpdatePixels()` — line 445
- `AF.CreateAura(parent, noPixelUpdates)` — line 469

### [.unused/ItemLoadExecutorTest.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/.unused/ItemLoadExecutorTest.lua)

TOC: disabled or not directly listed.

Data, internal helpers, templates or declarations without a direct AF export.

### [Data/ObjectPool.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Data/ObjectPool.lua)

TOC: enabled.

- `AF_ObjectPoolMixin:GetAllActives()` — line 20
- `AF.CreateObjectPool(creationFunc, resetterFunc)` — line 32

### [Data/Queue.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Data/Queue.lua)

TOC: enabled.

- `AF.NewQueue(threshold)` — line 74

### [Demo.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Demo.lua)

TOC: enabled.

- `AF.ShowDemo()` — line 4

### [Executors/ItemLoadExecutor.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Executors/ItemLoadExecutor.lua)

TOC: enabled.

- `AF_ItemLoadExecutorMixin:Submit(items, arg)` — line 11
- `AF_ItemLoadExecutorMixin:ProcessNextBatch()` — line 34
- `AF_ItemLoadExecutorMixin:OnItemLoaded()` — line 71
- `AF_ItemLoadExecutorMixin:OnItemLoadFailed()` — line 82
- `AF_ItemLoadExecutorMixin:ProcessNextItem()` — line 101
- `AF_ItemLoadExecutorMixin:StartTimeout()` — line 141
- `AF_ItemLoadExecutorMixin:StopTimeout()` — line 147
- `AF_ItemLoadExecutorMixin:OnUpdate()` — line 153
- `AF.BuildItemLoadExecutor(itemHandler, onEachGroupStart, onEachGroupFinish, onAllFinish)` — line 166

### [Executors/OnUpdateExecutor.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Executors/OnUpdateExecutor.lua)

TOC: enabled.

- `AF_OnUpdateExecutorMixin:Submit(tasks, useKey)` — line 16
- `AF_OnUpdateExecutorMixin:AddTask(task)` — line 32
- `AF_OnUpdateExecutorMixin:Pause()` — line 38
- `AF_OnUpdateExecutorMixin:Execute()` — line 43
- `AF_OnUpdateExecutorMixin:RunImmediately()` — line 49
- `AF_OnUpdateExecutorMixin:Clear()` — line 57
- `AF_OnUpdateExecutorMixin:OnUpdate()` — line 66
- `AF_OnUpdateExecutorMixin:OnShow()` — line 100
- `AF_OnUpdateExecutorMixin:OnHide()` — line 105
- `AF.BuildOnUpdateExecutor(taskHandler, onFinish, tasksPerFrame)` — line 119

### [Init.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Init.lua)

TOC: enabled.

- `AF.UIParent:FIRST_FRAME_RENDERED()` — line 115
- `AF.UIParent:UI_SCALE_CHANGED()` — line 123
- `AF.UIParent:ADDON_LOADED(addon)` — line 129
- `AF.SetScale(scale, skipPixelsUpdate)` — line 175
- `AF.GetScale()` — line 186
- `AF.SetUIParentScale(scale, skipPixelsUpdate)` — line 190

Assigned exports/fields: `AF.DecodeBase64`, `AF.DecodeJson`, `AF.EncodeBase64`, `AF.EncodeHJson`, `AF.EncodeJson`, `AF.GetQRCodeFrame`, `AF.GetQRCodeString`, `AF.Libs`, `AF.MD5`, `AF.SHA256`, `AF.UIParent`, `AF.flavor`, `AF.hiddenParent`, `AF.isAsian`, `AF.isCata`, `AF.isMists`, `AF.isRetail`, `AF.isTBC`, `AF.isVanilla`, `AF.isWrath`, `AF.name`, `AF.noop`, `AF.noop_false`, `AF.noop_true`, `AF.portal`, `AF.scale`.

### [Libs/FAIAP.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Libs/FAIAP.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Libs/base64.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Libs/base64.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Libs/json.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Libs/json.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Libs/md5.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Libs/md5.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Libs/qrcode.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Libs/qrcode.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Libs/sha256.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Libs/sha256.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Libs/utf8.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Libs/utf8.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/Post.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/Post.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/deDE.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/deDE.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/enUS.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/enUS.lua)

TOC: enabled.


Assigned exports/fields: `AF.L`.

### [Locales/esES.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/esES.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/esMX.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/esMX.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/frFR.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/frFR.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/itIT.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/itIT.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/koKR.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/koKR.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/ptBR.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/ptBR.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/ruRU.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/ruRU.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/zhCN.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/zhCN.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Locales/zhTW.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Locales/zhTW.lua)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Media/Glyphs.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Media/Glyphs.lua)

TOC: enabled.


Assigned exports/fields: `AF.Glyphs`.

### [Media/Media.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Media/Media.lua)

TOC: enabled.

- `AF.GetMedia(path, addon)` — line 10
- `AF.GetIcon(icon, addon)` — line 24
- `AF.GetIconString(icon, height, width, addon)` — line 39
- `AF.EscapeIcon(iconPath, height, width)` — line 70
- `AF.EscapeAtlas(atlas, width, height)` — line 83
- `AF.EscapeRaidIcon(raidIconIndex)` — line 87
- `AF.GetLogo(brand)` — line 98
- `AF.GetTexture(texture, addon)` — line 108
- `AF.GetPlainTexture()` — line 120
- `AF.GetEmptyTexture()` — line 128
- `AF.GetSound(sound, addon)` — line 138
- `AF.PlaySound(sound, addon, channel)` — line 157
- `AF.GetFont(font, addon)` — line 167
- `AF.GetProfessionIcon(profession)` — line 203
- `AF.GetCalendarIcon(iconType, index)` — line 223
- `AF.SetRoleIcon(texture, style, role)` — line 251

### [Media/SharedMedia.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Media/SharedMedia.lua)

TOC: enabled.

- `AF.LSM_GetBarTexture(name)` — line 39
- `AF.LSM_GetBarTextureDropdownItems()` — line 46
- `AF.LSM_GetFont(name)` — line 62
- `AF.LSM_GetFontDropdownItems()` — line 71
- `AF.LSM_GetFontOutlineDropdownItems()` — line 87
- `AF.SetFont(fs, font, size, outline, shadow)` — line 104
- `AF.UpdateFont(fontObj, font, size, outline)` — line 149
- `AF.SetFontShadow(fontObj, shadowPos, shadowColor)` — line 173
- `AF.RemoveFontShadow(fontObj)` — line 186

### [Spells/Bleeds.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Spells/Bleeds.lua)

TOC: enabled.

- `AF.GetDebuffType(auraData)` — line 6

### [Spells/Common.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Spells/Common.lua)

TOC: enabled.

- `AF.GetSpellInfo(spellId, alwaysReturnValue)` — line 15
- `AF.GetSpellInfo(spellId, alwaysReturnValue)` — line 32
- `AF.RemoveInvalidSpells(t)` — line 55
- `AF.GetSpellRankSuffix(rank)` — line 108
- `AF.GetSpellMaxRank(spellId)` — line 112
- `AF.IsSpellReady(spellId)` — line 182
- `AF.FindAuraById(unit, filter, spellId)` — line 201

Assigned exports/fields: `AF.GetSpellCooldown`, `AF.SpellExists`.

### [Spells/CrowdControls.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Spells/CrowdControls.lua)

TOC: enabled.

- `AF.GetCrowdControlType(auraData)` — line 234

### [Spells/Dispellables.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Spells/Dispellables.lua)

TOC: enabled.

- `AF.CanDispel(debuffType)` — line 9

### [Spells/Dispellables_Mists.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Spells/Dispellables_Mists.lua)

TOC: enabled.

- `AF.CanDispel(debuffType)` — line 11

### [Spells/Interrupts.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Spells/Interrupts.lua)

TOC: enabled.

- `AF.InterruptUsable()` — line 75

### [System/Addon.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/System/Addon.lua)

TOC: enabled.

- `AF.GetAddon()` — line 15
- `AF.GetAddOnMetadata(fieldName, addon)` — line 27
- `AF.GetAddOnVersion(addon)` — line 38
- `AF.Debug(arg, ...)` — line 58
- `AF.Print(...)` — line 79
- `AF.Printf(msg, ...)` — line 83
- `AF.PrintStack()` — line 88
- `AF.RegisterAddon(addonFolderName, alias)` — line 96
- `AF.RequireVersion(versionNum)` — line 103
- `AF.PrintIsSecret(...)` — line 125
- `AF.ToggleSecretTesting()` — line 143

Assigned exports/fields: `AF.REGISTERED_ADDONS`.

### [System/CallbackHandler.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/System/CallbackHandler.lua)

TOC: enabled.

- `AF.RegisterCallback(event, callback, priority, tag)` — line 19
- `AF.GetCallbacks(event, tag)` — line 39
- `AF.UnregisterCallback(event, callback)` — line 49
- `AF.UnregisterAllCallbacks(event)` — line 67
- `AF.RegisterCallbackOnce(event, callback, priority)` — line 76
- `AF.Fire(event, ...)` — line 131
- `AF.GetFireFunc(event, ...)` — line 180
- `AF.RegisterAddonLoaded(addon, func)` — line 228
- `AF.UnregisterAddonLoaded(addon, func)` — line 235

Assigned exports/fields: `AF.DEBUG_EVENTS`.

### [System/Communication.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/System/Communication.lua)

TOC: enabled.

- `AF.RegisterComm(prefix, callback)` — line 19
- `AF.UnregisterComm(prefix)` — line 28
- `AF.SendCommMessage_Whisper(prefix, data, target, priority, callbackFn, callbackArg, isSerializedData)` — line 43
- `AF.SendCommMessage_Group(prefix, data, priority, callbackFn, callbackArg, isSerializedData)` — line 57
- `AF.SendCommMessage_Guild(prefix, data, isOfficer, priority, callbackFn, callbackArg, isSerializedData)` — line 84
- `AF.SendCommMessage_Channel(prefix, data, channelName, priority, callbackFn, callbackArg, isSerializedData)` — line 103
- `AF.RegisterTemporaryChannel(channelName, joinNow)` — line 144
- `AF.UnregisterChannel(channelName, leaveNow)` — line 171
- `AF.BlockChatConfigFrameInteractionForChannel(channelName)` — line 226
- `AF.SendChatMessage(message, chatType, target)` — line 331

Assigned exports/fields: `AF.registeredChannels`.

### [System/EventHandler.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/System/EventHandler.lua)

TOC: enabled.

- `AF.AddEventHandler(obj)` — line 244
- `AF_BasicEventHandlerMixin:RegisterEvent(...)` — line 297
- `AF.AddSimpleEventHandler(frame)` — line 305
- `AF.CreateSimpleEventHandler(...)` — line 325
- `AF.CreateBasicEventHandler(onEventFunc, ...)` — line 346

### [System/Events.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/System/Events.lua)

TOC: enabled.

- `AF.IsInInstance()` — line 78
- `AF.GetInstanceInfo()` — line 92
- `AF.UnitTokenFromName(name)` — line 197

### [System/Hooks.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/System/Hooks.lua)

TOC: enabled.

- `AF.Hook(obj, method, handler)` — line 12
- `AF.Unhook(obj, method, handler)` — line 47

### [System/Scripts.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/System/Scripts.lua)

TOC: enabled.

- `AF.CompileWithGlobalEnv(script, env)` — line 8
- `AF.CompileWithEnv(script, env)` — line 27

### [Units/Class.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Units/Class.lua)

TOC: enabled.

- `AF.GetClassID(classFileOrLocalized)` — line 48
- `AF.GetClassFile(classIDOrLocalized)` — line 55
- `AF.GetLocalizedClassName(classFileOrID)` — line 63
- `AF.GetClassIcon(classFileOrID)` — line 73
- `AF.IterateClasses()` — line 81
- `AF.IterateSortedClasses()` — line 92
- `AF.GetSortedClasses()` — line 102
- `AF.GetSpecIcon(specID)` — line 194
- `AF.GetSpecRole(specID)` — line 200
- `AF.GetSpecName(specID)` — line 206
- `AF.GetLocalizedSpecName(specID)` — line 211
- `AF.GetSpecIconForClassID(classID, index)` — line 217
- `AF.GetClassFileForSpecID(specID)` — line 223
- `AF.GetLocalizedClassNameForSpecID(specID)` — line 229
- `AF.GetClassIDForSpecID(specID)` — line 235

### [Units/Common.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Units/Common.lua)

TOC: enabled.

- `AF.GetNumSubgroupMembers(group)` — line 43
- `AF.GetUnitsInSubGroup(group)` — line 56
- `AF.GetRaidInfoByName(fullName)` — line 75
- `AF.GetRaidInfoBySubgroupIndex(group, subgroupIndex)` — line 94
- `AF.GetPlayerPetUnitID(playerUnitID)` — line 111
- `AF.GetPetOwnerUnitID(petUnitID)` — line 123
- `AF.IterateGroupPlayers()` — line 132
- `AF.IterateGroupPets()` — line 157
- `AF.GetGroupType()` — line 175
- `AF.UnitInGroup(unit, ignorePets)` — line 188
- `AF.GetBestUnitIDForTarget(target)` — line 199
- `AF.GetTargetUnitInfo()` — line 229
- `AF.GetPetUnit(playerUnit)` — line 258
- `AF.HasGroupPermission()` — line 272
- `AF.HasMarkerPermission()` — line 276
- `AF.UnitIsPlayer(unit)` — line 288
- `AF.IsFriend(unitFlags)` — line 299
- `AF.IsPlayer(guid)` — line 312
- `AF.IsPet(guidOrUnit)` — line 318
- `AF.IsNPC(guid)` — line 329
- `AF.IsVehicle(guid)` — line 335
- `AF.UnitFullName(unit)` — line 345
- `AF.ToShortName(fullName)` — line 370
- `AF.ToFullName(shortName, server)` — line 376
- `AF.GetRealmName(fullName)` — line 388
- `AF.IsConnectedRealm(name)` — line 395
- `AF.IsSameFaction(unit1, unit2)` — line 412
- `AF.IsMaxLevel(unit)` — line 424
- `AF.GetLevelText(unit)` — line 433
- `AF.GetNPCSubtitle(unit)` — line 517
- `AF.GetNPCFaction(unit)` — line 535

Assigned exports/fields: `AF.UnitShortName`.

### [Units/ItemLevel.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Units/ItemLevel.lua)

TOC: enabled.


Assigned exports/fields: `AF.ItemLevel`.

### [Units/Player.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Units/Player.lua)

TOC: enabled.

- `AF.UnitClassBase(unit)` — line 24

Assigned exports/fields: `AF.connectedRealms`, `AF.player`.

### [Units/RangeCheck.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Units/RangeCheck.lua)

TOC: enabled.

- `AF.IsInRange(unit, check)` — line 180

### [Units/StatusTimer.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Units/StatusTimer.lua)

TOC: enabled.

- `AF_StatusTimerMixin:SetCallback(func)` — line 74
- `AF_StatusTimerMixin:SetTimerGUID(guid)` — line 78
- `AF_StatusTimerMixin:ClearTimerGUID()` — line 84
- `AF_StatusTimerMixin:IsTimerGUIDValid()` — line 88
- `AF_StatusTimerMixin:StartTimer(status)` — line 104
- `AF_StatusTimerMixin:StopTimer(clearStatus)` — line 124

### [Utils/AsyncLoaders.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/AsyncLoaders.lua)

TOC: enabled.

- `AF.LoadSpellAsync(spellID, callback)` — line 101
- `AF.LoadItemAsync(itemID, callback)` — line 107
- `AF.LoadSpellNameAsync(spellID, callback)` — line 117
- `AF.LoadItemNameAsync(itemID, callback)` — line 123
- `AF.LoadSpellIconAsync(spellID, callback)` — line 134
- `AF.LoadItemIconAsync(itemID, callback)` — line 140
- `AF.LoadItemQualityAsync(itemID, callback)` — line 150

### [Utils/Color.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/Color.lua)

TOC: enabled.

- `AF.ConvertToRGB(r, g, b, a, saturation)` — line 18
- `AF.ConvertToRGB256(r, g, b, a, saturation)` — line 37
- `AF.ConvertRGB256ToHEX(r, g, b, a)` — line 52
- `AF.ConvertRGBToHEX(r, g, b, a)` — line 84
- `AF.ConvertHEXToRGB256(hex)` — line 94
- `AF.ConvertHEXToRGB(hex)` — line 109
- `AF.ConvertRGBToHSB(r, g, b)` — line 120
- `AF.ConvertHSBToRGB(h, s, b)` — line 169
- `AF.ScaleColor(r, g, b, factor)` — line 206
- `AF.ScaleColorHex(color, factor, alpha)` — line 218
- `AF.InvertColor(r, g, b, a)` — line 233
- `AF.InvertColorHex(hex)` — line 239
- `AF.GetComplementColor(r, g, b, a)` — line 253
- `AF.GetComplementColorHex(hex)` — line 262
- `AF.AdjustColorSaturationBrightness(r, g, b, saturation, brightness)` — line 276
- `AF.ConvertToGrayscale(r, g, b, a)` — line 283
- `AF.ColorGradient(perc, c1, c2, c3, lowBound, highBound)` — line 298
- `AF.ColorThreshold(perc, c1, c2, c3, lowBound, highBound)` — line 331
- `AF.FillColorTable(colorTable, r, g, b, a)` — line 354

### [Utils/Curve.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/Curve.lua)

TOC: enabled.

- `AF.CreateColorCurve()` — line 20
- `AF_ColorCurveMixin:Init()` — line 26
- `AF_ColorCurveMixin:AddPoint(x, y)` — line 60
- `AF_ColorCurveMixin:RemovePoint(index)` — line 65
- `AF_ColorCurveMixin:SetPoints(points)` — line 72
- `AF_ColorCurveMixin:ClearPoints()` — line 80
- `AF_ColorCurveMixin:GetPoints()` — line 85
- `AF_ColorCurveMixin:GetPointCount()` — line 90
- `AF_ColorCurveMixin:SetType(curveType)` — line 306
- `AF_ColorCurveMixin:GetType()` — line 316
- `AF_ColorCurveMixin:EvaluateUnpacked(x)` — line 324
- `AF.CreateBlizzardColorCurve(points, curveType)` — line 345
- `AF.GetAlphaCurve_HideWhenFull()` — line 360
- `AF.GetAlphaCurve_HideWhenEmpty()` — line 368
- `AF.GetAlphaCurve_HideWhenFullOrEmpty()` — line 376

### [Utils/DateTime.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/DateTime.lua)

TOC: enabled.

- `AF.FormatTime(sec, format)` — line 27
- `AF.GetDateString(sec)` — line 35
- `AF.GetDateSeconds(dateStr)` — line 41
- `AF.GetDateTable(sec)` — line 51
- `AF.GetNextDaySeconds(asRemaining)` — line 60
- `AF.IsToday(sec, useServerTime)` — line 79
- `AF.FormatDuration(sec)` — line 98
- `AF.FormatDurationInt(sec)` — line 110
- `AF.FormatRelativeTime(sec)` — line 122

### [Utils/Delay.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/Delay.lua)

TOC: enabled.

- `AF.DelayedInvoke(delay, func, ...)` — line 15
- `AF.GetDelayedInvoker(delay, func)` — line 58
- `AF.DelayedInvokeForObj(delay, obj, func, ...)` — line 73
- `AF.GetDelayedInvokerForObj(delay, obj, func)` — line 129

### [Utils/Math.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/Math.lua)

TOC: enabled.

- `AF.ApproxEqual(a, b, epsilon)` — line 15
- `AF.ApproxZero(n)` — line 19
- `AF.Round(num)` — line 23
- `AF.RoundToDecimal(num, numDecimalPlaces)` — line 30
- `AF.RoundToNearestMultiple(num, multiplier)` — line 39
- `AF.CeilToEven(num)` — line 43
- `AF.Interpolate(startValue, endValue, step, maxSteps)` — line 52
- `AF.Lerp(startValue, endValue, amount)` — line 59
- `AF.Clamp(value, minValue, maxValue)` — line 63
- `AF.PercentageBetween(value, startValue, endValue)` — line 76
- `AF.ClampedPercentageBetween(value, startValue, endValue)` — line 83

Assigned exports/fields: `AF.epsilon`.

### [Utils/PixelUtil.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/PixelUtil.lua)

TOC: enabled.

- `AF.GetPixelFactor()` — line 8
- `AF.GetBestScale()` — line 13
- `AF.GetNearestPixelSize(uiUnitSize, layoutScale, minPixels)` — line 37
- `AF.ConvertPixels(desiredPixels)` — line 63
- `AF.ConvertPixelsForRegion(desiredPixels, region)` — line 67
- `AF.GetOnePixelForRegion(region)` — line 74
- `AF.SetWidth(region, width, minPixels)` — line 81
- `AF.SetHeight(region, height, minPixels)` — line 91
- `AF.SetListWidth(region, itemNum, itemWidth, itemSpacing, leftPadding, rightPadding)` — line 108
- `AF.SetListHeight(region, itemNum, itemHeight, itemSpacing, topPadding, bottomPadding)` — line 140
- `AF.SetScrollContentHeight(content, heights, spacing)` — line 167
- `AF.SetGridSize(region, gridWidth, gridHeight, gridSpacingX, gridSpacingY, columns, rows, topPadding, bottomPadding, leftPadding, rightPadding)` — line 207
- `AF.SetSize(region, width, height)` — line 254
- `AF.SetPoint(region, ...)` — line 264
- `AF.SetOnePixelInside(region, relativeTo)` — line 304
- `AF.SetOnePixelOutside(region, relativeTo)` — line 313
- `AF.SetAllPoints(region, relativeTo)` — line 320
- `AF.SetInside(region, relativeTo, offsetX, offsetY)` — line 328
- `AF.SetOutside(region, relativeTo, offsetX, offsetY)` — line 341
- `AF.SetOutsets(region, relativeTo, left, right, top, bottom)` — line 358
- `AF.ClearPoints(region)` — line 369
- `AF.AdjustPointsOffset(region, offsetX, offsetY)` — line 374
- `AF.SetBackdrop(region, backdropInfo)` — line 392
- `AF.SetBackdropBorderSize(region, borderSize)` — line 408
- `AF.ReSize(region)` — line 433
- `AF.RePoint(region)` — line 456
- `AF.ReBorder(region)` — line 472
- `AF.DefaultUpdatePixels(frame)` — line 528
- `AF.AddToPixelUpdater_Auto(r, fn, combatSafeOnly)` — line 596
- `AF.UpdatePixels_Auto()` — line 613
- `AF.AddToPixelUpdater_OnShow(r, target, fn, combatSafeOnly)` — line 667
- `AF.AddToPixelUpdater_CustomGroup(group, r, fn, combatSafeOnly)` — line 745
- `AF.GetPixelUpdater_CustomGroupComponents(group)` — line 776
- `AF.UpdatePixels_CustomGroup(group)` — line 781
- `AF.RemoveFromPixelUpdater(r)` — line 797
- `AF.UpdatePixelsForRegionAndChildren(region)` — line 818
- `AF.SnapRegionToPixel(region)` — line 845
- `AF.ReAnchorRegion(region, anchor)` — line 859
- `AF.SetStatusBarValue(statusBar, value)` — line 889
- `AF.LoadWidgetPosition(widget, pos, relativeTo)` — line 910
- `AF.AlignTextBasedOnPoint(fs, point)` — line 920
- `AF.LoadTextPosition(fs, pos, relativeTo)` — line 941
- `AF.GetAnchorPoints_Simple(arrangement, spacingX, spacingY)` — line 957
- `AF.GetAnchorPoints_Complex(arrangement, spacingX, spacingY)` — line 995
- `AF.GetAnchorPoints_GroupHeader(arrangement, spacingX, spacingY)` — line 1070
- `AF.UpdateContainerSizeForArrangement(container, arrangement, numItems, numItemsPerLine, itemWidth, itemHeight, spacingX, spacingY)` — line 1144
- `AF.LoadPosition(region, pos, relativeTo)` — line 1163
- `AF.SavePositionAsTable(region, t)` — line 1195
- `AF.SavePositionAsString(region, t, k)` — line 1210
- `AF.GetAdaptiveAnchor_Vertical(frame, verticalThreshold)` — line 1225
- `AF.GetAdaptiveAnchor_Horizontal(frame, horizontalThreshold)` — line 1242

Assigned exports/fields: `AF.PIXEL_PERFECT_AUTO_COMPONENTS`, `AF.PIXEL_PERFECT_CUSTOMGROUP_COMPONENTS`, `AF.PIXEL_PERFECT_ONSHOW_COMPONENTS`.

### [Utils/Serialization.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/Serialization.lua)

TOC: enabled.

- `AF.Serialize(data, isForAddonChannel)` — line 14
- `AF.Deserialize(encoded, isForAddonChannel)` — line 32

### [Utils/String.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/String.lua)

TOC: enabled.

- `AF.UpperFirst(str, lowerOthers)` — line 13
- `AF.LowerFirst(str)` — line 22
- `AF.RemoveWhitespaces(str)` — line 27
- `AF.UpperEachWord(str, lowerOthers)` — line 37
- `AF.SplitString(sep, str)` — line 50
- `AF.StringToTable(str, sep, convertToNum)` — line 60
- `AF.TableToString(t, sep, useKey, useValue)` — line 82
- `AF.IsBlank(str)` — line 100
- `AF.GetNumStringLines(str)` — line 107
- `AF.FormatNumber_Asian(n)` — line 131
- `AF.FormatNumber(n)` — line 141
- `AF.FormatSecretNumber_Asian(n)` — line 187
- `AF.FormatSecretNumber(n)` — line 191
- `AF.FormatSecretPercentage(n)` — line 206
- `AF.FormatMoney(copper, style, useCommas, goldOnly)` — line 242
- `AF.TruncateStringByLength(s, enChars, nonEnChars)` — line 294

### [Utils/Table.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Utils/Table.lua)

TOC: enabled.

- `AF.Getn(t)` — line 14
- `AF.GetIndex(t, e)` — line 22
- `AF.GetKeys(t)` — line 31
- `AF.GetMaxKeyValue(t)` — line 42
- `AF.Copy(...)` — line 58
- `AF.Contains(t, v)` — line 73
- `AF.IndexOf(t, v)` — line 80
- `AF.LastIndexOf(t, v)` — line 87
- `AF.GetLast(t)` — line 98
- `AF.Insert(t, v)` — line 108
- `AF.Remove(t, v)` — line 122
- `AF.Merge(t, ...)` — line 133
- `AF.MergeRaw(t, ...)` — line 149
- `AF.MergeExistingKeys(t, ...)` — line 161
- `AF.MergeMissingKeys(t, ...)` — line 179
- `AF.InsertAll(t, ...)` — line 197
- `AF.InsertIfNotExists(t, ...)` — line 209
- `AF.IsEmpty(t)` — line 230
- `AF.RemoveElementsExceptKeys(tbl, ...)` — line 241
- `AF.RemoveElementsByKeys(tbl, ...)` — line 256
- `AF.MoveElementToEnd(t, index)` — line 263
- `AF.MoveElementToIndex(t, fromIndex, toIndex)` — line 272
- `AF.TransposeTable(t, value)` — line 285
- `AF.SwapKeyValue(t)` — line 295
- `AF.ConvertTable(t, processor)` — line 306
- `AF.ExtractSubTableValues(t, key)` — line 321
- `AF.TransposeSpellTable(t, convertIdToName)` — line 335
- `AF.Sort(t, ...)` — line 379
- `AF.Unpack2(t)` — line 395
- `AF.Unpack3(t)` — line 399
- `AF.Unpack4(t)` — line 403
- `AF.Unpack5(t)` — line 407
- `AF.Unpack6(t)` — line 411
- `AF.Unpack7(t)` — line 415
- `AF.Unpack8(t)` — line 419

### [Widgets/Animation.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Animation.lua)

TOC: enabled.

- `AF.FrameFadeIn(frame, timeToFade, startAlpha, endAlpha)` — line 74
- `AF.FrameFadeOut(frame, timeToFade, startAlpha, endAlpha, hideAfterFade)` — line 99
- `AF.FrameFadeTo(frame, timeToFade, targetAlpha)` — line 122
- `AF.FrameFadeInOut(frame, timeToFade, holdTime, startFromCurrentAlpha)` — line 211
- `AF.FrameZoomIn(frame, timeToZoom, startScale, endScale)` — line 285
- `AF.FrameZoomOut(frame, timeToZoom, startScale, endScale)` — line 301
- `AF.FrameZoomTo(frame, timeToZoom, endScale)` — line 317
- `AF.FrameResizeTo(frame, timeToSize, startWidth, startHeight, endWidth, endHeight, hideAfterResize)` — line 410
- `AF.FrameResizeWidth(frame, timeToSize, startWidth, endWidth, hideAfterResize)` — line 434
- `AF.FrameResizeHeight(frame, timeToSize, startHeight, endHeight, hideAfterResize)` — line 442
- `AF.FrameFlashStart(frame, fadeInTime, fadeOutTime, flashDuration, showWhenDone, flashInHoldTime, flashOutHoldTime, syncId)` — line 541
- `AF.FrameFlashStop(frame, forceVisible)` — line 578
- `AF.CreateFadeInOutAnimation(region, duration, noHide)` — line 660
- `AF.CreateContinualFadeInOutAnimation(region, duration, delay)` — line 726
- `AF.CreateBlinkAnimation(region, duration, hook)` — line 768
- `AF.AnimatedResize(frame, targetWidth, targetHeight, frequency, steps, onStart, onFinish, onChange, anchorPoint)` — line 811

### [Widgets/Base.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Base.lua)

TOC: enabled.

- `AF.InvokeOnEnter(region)` — line 35
- `AF.InvokeOnLeave(region)` — line 41
- `AF_BaseWidgetMixin:SetOnShow(func)` — line 54
- `AF_BaseWidgetMixin:HookOnShow(func)` — line 58
- `AF_BaseWidgetMixin:GetOnShow()` — line 62
- `AF_BaseWidgetMixin:InvokeOnShow()` — line 68
- `AF_BaseWidgetMixin:SetOnHide(func)` — line 73
- `AF_BaseWidgetMixin:HookOnHide(func)` — line 77
- `AF_BaseWidgetMixin:GetOnHide()` — line 81
- `AF_BaseWidgetMixin:InvokeOnHide()` — line 87
- `AF_BaseWidgetMixin:SetOnEnter(func)` — line 92
- `AF_BaseWidgetMixin:HookOnEnter(func)` — line 96
- `AF_BaseWidgetMixin:GetOnEnter()` — line 100
- `AF_BaseWidgetMixin:InvokeOnEnter()` — line 106
- `AF_BaseWidgetMixin:SetOnLeave(func)` — line 111
- `AF_BaseWidgetMixin:HookOnLeave(func)` — line 115
- `AF_BaseWidgetMixin:GetOnLeave()` — line 119
- `AF_BaseWidgetMixin:InvokeOnLeave()` — line 125
- `AF_BaseWidgetMixin:SetOnMouseDown(func)` — line 130
- `AF_BaseWidgetMixin:HookOnMouseDown(func)` — line 134
- `AF_BaseWidgetMixin:GetOnMouseDown()` — line 138
- `AF_BaseWidgetMixin:SetOnMouseUp(func)` — line 145
- `AF_BaseWidgetMixin:HookOnMouseUp(func)` — line 149
- `AF_BaseWidgetMixin:GetOnMouseUp()` — line 153
- `AF_BaseWidgetMixin:SetOnMouseWheel(func)` — line 160
- `AF_BaseWidgetMixin:HookOnMouseWheel(func)` — line 164
- `AF_BaseWidgetMixin:GetOnMouseWheel()` — line 168
- `AF_BaseWidgetMixin:SetOnLoad(func)` — line 175
- `AF_BaseWidgetMixin:HookOnLoad(func)` — line 179
- `AF_BaseWidgetMixin:GetOnLoad()` — line 183
- `AF_BaseWidgetMixin:SetOnEnable(func)` — line 190
- `AF_BaseWidgetMixin:HookOnEnable(func)` — line 196
- `AF_BaseWidgetMixin:GetOnEnable()` — line 202
- `AF_BaseWidgetMixin:SetOnDisable(func)` — line 211
- `AF_BaseWidgetMixin:HookOnDisable(func)` — line 217
- `AF_BaseWidgetMixin:GetOnDisable()` — line 223
- `AF_BaseWidgetMixin:SetOnUpdate(func)` — line 232
- `AF_BaseWidgetMixin:HookOnUpdate(func)` — line 238
- `AF_BaseWidgetMixin:GetOnUpdate()` — line 244
- `AF_BaseWidgetMixin:SetOnSizeChanged(func)` — line 253
- `AF_BaseWidgetMixin:HookOnSizeChanged(func)` — line 259
- `AF_BaseWidgetMixin:GetOnSizeChanged()` — line 265
- `AF_BaseWidgetMixin:BlockMouse(block)` — line 276
- `AF_BaseWidgetMixin:SyncEnableDisableWith(frame)` — line 286
- `AF_BaseWidgetMixin:Toggle()` — line 296
- `AF.SetEnabled(isEnabled, ...)` — line 307
- `AF.Enable(...)` — line 334
- `AF.Disable(...)` — line 338
- `AF.Show(...)` — line 345
- `AF.Hide(...)` — line 354
- `AF.Toggle(...)` — line 363
- `AF.SetChecked(checked, ...)` — line 377
- `AF.SetFrameLevel(frame, level, relativeTo)` — line 392
- `AF.ClearBackdrop(frame)` — line 404
- `AF.ApplyDefaultBackdrop(frame, borderSize)` — line 410
- `AF.ApplyDefaultBackdrop_NoBackground(frame, borderSize)` — line 418
- `AF.ApplyDefaultBackdrop_NoBorder(frame)` — line 426
- `AF.ApplyDefaultBackdropColors(frame)` — line 434
- `AF.ApplyDefaultBackdropWithColors(frame, color, borderColor, borderSize)` — line 446
- `AF.SetBackdropHighlight(frame, target, borderHighlightColor, backgroundHighlightColor)` — line 470
- `AF.SetDraggable(frame, target, notUserPlaced, onDragStart, onDragStop)` — line 511
- `AF.AttachToCursor(frame, anchorPoint, offsetX, offsetY)` — line 536
- `AF.DetachFromCursor(frame)` — line 568
- `AF.GetMouseFocus()` — line 578
- `AF.ShowProtectedFrame(frame)` — line 603
- `AF.HideProtectedFrame(frame)` — line 613
- `AF.SetProtectedFrameShown(frame, shown)` — line 623

Assigned exports/fields: `AF.FrameClearAllPoints`, `AF.FrameGetHeight`, `AF.FrameGetSize`, `AF.FrameGetWidth`, `AF.FrameHide`, `AF.FrameSetCooldown`, `AF.FrameSetCooldownDuration`, `AF.FrameSetFrameLevel`, `AF.FrameSetHeight`, `AF.FrameSetPoint`, `AF.FrameSetSize`, `AF.FrameSetWidth`, `AF.FrameShow`, `AF.TextureHide`, `AF.TextureShow`.

### [Widgets/Button.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Button.lua)

TOC: enabled.

- `AF_ButtonMixin:HandleMouseDownText()` — line 43
- `AF_ButtonMixin:HandleMouseUpText()` — line 50
- `AF_ButtonMixin:HandleMouseDownTexture()` — line 58
- `AF_ButtonMixin:HandleMouseUpTexture()` — line 63
- `AF_ButtonMixin:EnablePushEffect(enabled)` — line 68
- `AF_ButtonMixin:SetTextHighlightColor(color)` — line 73
- `AF_ButtonMixin:SetText(str)` — line 87
- `AF_ButtonMixin:SetFormattedText(text, ...)` — line 91
- `AF_ButtonMixin:GetText()` — line 95
- `AF_ButtonMixin:GetFontString()` — line 99
- `AF_ButtonMixin:SetTextColor(color)` — line 104
- `AF_ButtonMixin:SetFontObject(f)` — line 108
- `AF_ButtonMixin:SetFont(...)` — line 112
- `AF_ButtonMixin:GetFont()` — line 116
- `AF_ButtonMixin:SetTextJustifyH(justify)` — line 120
- `AF_ButtonMixin:SetTextPadding(padding)` — line 128
- `AF_ButtonMixin:SetBorderHighlightColor(color)` — line 146
- `AF_ButtonMixin:SetBorderColor(color)` — line 165
- `AF_ButtonMixin:SetColor(color)` — line 184
- `AF_ButtonMixin:LockHighlight()` — line 204
- `AF_ButtonMixin:UnlockHighlight()` — line 209
- `AF_ButtonMixin:GetOnClick()` — line 214
- `AF_ButtonMixin:SetOnClick(func)` — line 218
- `AF_ButtonMixin:HookOnClick(func)` — line 222
- `AF_ButtonMixin:SetTexture(tex, size, point, isAtlas, bgColor, justifyH, filterMode)` — line 232
- `AF_ButtonMixin:SetTextureColor(color)` — line 294
- `AF_ButtonMixin:ShowTexture()` — line 300
- `AF_ButtonMixin:HideTexture()` — line 317
- `AF_ButtonMixin:StartCooldown(sec)` — line 390
- `AF_ButtonMixin:StopCooldown()` — line 394
- `AF_ButtonMixin:UpdatePixels()` — line 400
- `AF_ButtonMixin:SetClickSound(sound)` — line 415
- `AF_ButtonMixin:SilentClick()` — line 427
- `AF_ButtonMixin:SetTooltip(...)` — line 433
- `AF.CreateButton(parent, text, color, width, height, template, borderColor, backgroundColor, font)` — line 447
- `AF.CreateButtonGroup(buttons, onSelect, onDeselect, onClick, onEnter, onLeave)` — line 564
- `AF.CreateCloseButton(parent, frameToHide, width, height, iconSize)` — line 629
- `AF_IconButtonMixin:HandleMouseDownTexture()` — line 652
- `AF_IconButtonMixin:HandleMouseUpTexture()` — line 656
- `AF_IconButtonMixin:EnablePushEffect(enabled)` — line 660
- `AF_IconButtonMixin:SetOnClick(func)` — line 664
- `AF_IconButtonMixin:HookOnClick(func)` — line 668
- `AF_IconButtonMixin:SetTexCoord(...)` — line 672
- `AF_IconButtonMixin:SetIcon(icon, filterMode)` — line 678
- `AF_IconButtonMixin:SetColor(color)` — line 692
- `AF_IconButtonMixin:SetHoverColor(color)` — line 701
- `AF_IconButtonMixin:SetHoverBorder(color)` — line 710
- `AF_IconButtonMixin:SetFilterMode(filterMode)` — line 732
- `AF_IconButtonMixin:SetTooltip(...)` — line 737
- `AF_IconButtonMixin:UpdatePixels()` — line 741
- `AF.CreateIconButton(parent, icon, width, height, padding, color, hoverColor, filterMode, noPushDownEffect, template)` — line 757
- `AF_TipsButtonMixin:SetTips(...)` — line 831
- `AF_TipsButtonMixin:SetTipsPosition(position, x, y)` — line 835
- `AF.CreateTipsButton(parent)` — line 842
- `AF_CheckButtonMixin:SetText(text)` — line 860
- `AF_CheckButtonMixin:SetTextColor(color)` — line 870
- `AF_CheckButtonMixin:SetTooltip(...)` — line 878
- `AF_CheckButtonMixin:UpdatePixels()` — line 882
- `AF_CheckButtonMixin:SetOnCheck(func)` — line 890
- `AF.CreateCheckButton(parent, label, onCheck)` — line 898
- `AF_SwitchMixin:SetSelectedValue(value, force)` — line 966
- `AF_SwitchMixin:GetSelectedValue()` — line 979
- `AF_SwitchMixin:GetSelectedButton()` — line 984
- `AF_SwitchMixin:SetOnSelect(callback)` — line 993
- `AF_SwitchMixin:SetLabel(label)` — line 1010
- `AF_SwitchMixin:SetLabels(labels)` — line 1021
- `AF_SwitchMixin:AutoResizeLabels()` — line 1169
- `AF.CreateSwitch(parent, width, height)` — line 1186
- `AF.CreateResizeButton(target, minWidth, minHeight, maxWidth, maxHeight)` — line 1226

### [Widgets/Calendar.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Calendar.lua)

TOC: enabled.

- `AF_CalendarButtonMixin:SetDate(d)` — line 355
- `AF_CalendarButtonMixin:SetMarks(marks)` — line 384
- `AF_CalendarButtonMixin:ClearMarks()` — line 392
- `AF_CalendarButtonMixin:SetOnDateChanged(callback)` — line 400
- `AF.CreateCalendarButton(parent, width, calendarPosition)` — line 407

Assigned exports/fields: `AF.FIRST_WEEKDAY`, `AF.RAID_LOCKOUT_RESET_DAY`, `AF.WEEKDAY_NAMES`.

### [Widgets/CascadingMenu.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/CascadingMenu.lua)

TOC: enabled.

- `AF.CloseCascadingMenu()` — line 180
- `AF.ShowCascadingMenu(parent, items, maxShownItems, point, relativePoint, x, y)` — line 216
- `AF_CascadingMenuButtonMixin:SetLabel(label, color, font)` — line 231
- `AF_CascadingMenuButtonMixin:SetEnabled(enabled)` — line 243
- `AF_CascadingMenuButtonMixin:OnMenuSelection(item, path)` — line 259
- `AF_CascadingMenuButtonMixin:SetItems(items)` — line 279
- `AF_CascadingMenuButtonMixin:LoadItems()` — line 287
- `AF_CascadingMenuButtonMixin:ToggleMenu()` — line 298
- `AF_CascadingMenuButtonMixin:SetTooltip(...)` — line 306
- `AF.CreateCascadingMenuButton(parent, width, maxShownItems)` — line 315

### [Widgets/Color.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Color.lua)

TOC: enabled.

- `AF.HasColor(color)` — line 211
- `AF.GetColorRGB(color, alpha, factor)` — line 222
- `AF.GetColorTable(color, alpha, factor)` — line 247
- `AF.GetColorHex(color, alpha, factor)` — line 269
- `AF.GetColorStr(color, alpha, factor)` — line 297
- `AF.GetAuraTypeColor(auraType, alpha)` — line 312
- `AF.GetItemQualityColor(quality, useDefault)` — line 329
- `AF.BuildAccentColorTable(color, buttonNormalColor, buttonHoverColor)` — line 369
- `AF.SetAccentColor(color, buttonNormalColor, buttonHoverColor)` — line 396
- `AF.ResetAccentColor()` — line 403
- `AF.GetAccentColorRGB(alpha, factor)` — line 415
- `AF.GetAccentColorTable(alpha, factor)` — line 422
- `AF.GetAccentColorHex(alpha, factor)` — line 429
- `AF.SetAddonAccentColor(addon, color, buttonNormalColor, buttonHoverColor)` — line 436
- `AF.GetAddonAccentColorName(addon)` — line 469
- `AF.GetAddonAccentColorTable(addon, alpha, factor)` — line 480
- `AF.GetAddonAccentColorRGB(addon, alpha, factor)` — line 490
- `AF.GetAddonAccentColorHex(addon, alpha, factor)` — line 497
- `AF.GetClassColor(class, alpha, factor)` — line 508
- `AF.GetUnitClassColor(unit)` — line 527
- `AF.GetReactionColor(unit, alpha, factor)` — line 547
- `AF.GetUnitColor(unit)` — line 566
- `AF.GetUnitColorName(unit)` — line 577
- `AF.GetLevelColor(unit)` — line 601
- `AF.GetPowerColor(power, unit, alpha, factor)` — line 624
- `AF.AddColor(name, color)` — line 649
- `AF.AddColors(t)` — line 665
- `AF.UnpackColor(t, alpha)` — line 677
- `AF.ExtractColor(t, alpha)` — line 686
- `AF.ColorFontString(fs, color)` — line 695
- `AF.WrapTextInColor(text, name)` — line 710
- `AF.WrapTextInColorRGB(text, r, g, b)` — line 723
- `AF.WrapTextInQualityColor(text, quality)` — line 730
- `AF.WrapTextInColorCode(text, colorHexString)` — line 739
- `AF.GetGradientText(text, startColor, endColor)` — line 752
- `AF.GetButtonNormalColor(name)` — line 810
- `AF.GetButtonHoverColor(name)` — line 842
- `AF.AddButtonColor(name, normalColor, hoverColor)` — line 877
- `AF.AddButtonColors(t)` — line 882

### [Widgets/ColorPicker.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/ColorPicker.lua)

TOC: enabled.

- `AF_ColorPickerMixin:EnableAlpha(enabled)` — line 10
- `AF_ColorPickerMixin:SetColor(...)` — line 16
- `AF_ColorPickerMixin:GetColorTable()` — line 38
- `AF_ColorPickerMixin:GetColorRGB()` — line 42
- `AF_ColorPickerMixin:SetOnChange(callback)` — line 47
- `AF_ColorPickerMixin:SetOnConfirm(callback)` — line 52
- `AF_ColorPickerMixin:UpdatePixels()` — line 57
- `AF.CreateColorPicker(parent, label, alphaEnabled, onChange, onConfirm)` — line 72
- `AF.ShowColorPicker(owner, callback, onConfirm, hasAlpha, r, g, b, a)` — line 832
- `AF.HideColorPicker()` — line 896

### [Widgets/DataBroker.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/DataBroker.lua)

TOC: enabled.

- `AF.NewMinimapButton(name, icon, db, onClick, tooltip, onEnter, onLeave)` — line 13

### [Widgets/Dialog.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Dialog.lua)

TOC: enabled.

- `AF_DialogMixin:EnableYes(enabled)` — line 21
- `AF_DialogMixin:EnableNo(enabled)` — line 26
- `AF_DialogMixin:SetToYesNo()` — line 30
- `AF_DialogMixin:SetToOkayCancel()` — line 37
- `AF_DialogMixin:SetToCustom(yesText, noText, buttonWidth)` — line 47
- `AF_DialogMixin:SetContent(content, height)` — line 57
- `AF_DialogMixin:SetOnConfirm(fn)` — line 70
- `AF_DialogMixin:SetOnCancel(fn)` — line 75
- `AF_DialogMixin:UpdatePixels()` — line 80
- `AF_DialogMixin:UpdateHeight()` — line 92
- `AF.IsDialogActive(dialog)` — line 217
- `AF.GetDialog(parent, text, width, noMask)` — line 226
- `AF_MessageDialogMixin:UpdatePixels()` — line 254
- `AF_MessageDialogMixin:UpdateHeight()` — line 262
- `AF.GetMessageDialog(parent, text, width, noMask, countdown)` — line 354
- `AF.ShowGlobalDialog(text, onConfirm, onCancel, showMask, yesText, noText)` — line 654

### [Widgets/DragSorter.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/DragSorter.lua)

TOC: enabled.

- `AF_DragSorterMixin:Refresh()` — line 137
- `AF_DragSorterMixin:SetWidgets(widgets, skipRefresh)` — line 202
- `AF_DragSorterMixin:SetConfigTable(configTable)` — line 256
- `AF_DragSorterMixin:SetCallback(callback)` — line 262
- `AF.CreateDragSorter(parent, name, slotSpacing, slotWidth, slotHeight, orientation)` — line 274

### [Widgets/Dropdown.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Dropdown.lua)

TOC: enabled.

- `AF.CloseDropdown()` — line 148
- `AF_DropdownMixin:SetSelectedText(text)` — line 212
- `AF_DropdownMixin:SetSelectedValue(value)` — line 216
- `AF_DropdownMixin:ClearSelected()` — line 221
- `AF_DropdownMixin:GetSelected()` — line 230
- `AF_DropdownMixin:SetLabel(label, color, font)` — line 239
- `AF_DropdownMixin:SetIconBGColor(color)` — line 252
- `AF_DropdownMixin:SetItems(items)` — line 278
- `AF_DropdownMixin:AddItem(item, pos)` — line 304
- `AF_DropdownMixin:RemoveCurrentItem()` — line 315
- `AF_DropdownMixin:ClearItems()` — line 321
- `AF_DropdownMixin:SetCurrentItem(item)` — line 327
- `AF_DropdownMixin:SetOnSelect(fn)` — line 352
- `AF_DropdownMixin:LoadItems()` — line 360
- `AF_DropdownMixin:SetEnabled(enabled)` — line 497
- `AF_DropdownMixin:SetTooltip(...)` — line 518
- `AF.CreateDropdown(parent, width, maxSlots, miniMode, textureAlpha, justify)` — line 529
- `AF.GetDropdownItems_AnchorPoint(noCenter)` — line 691
- `AF.GetDropdownItems_Modifier()` — line 702
- `AF.GetDropdownItems_Arrangement_Simple()` — line 711
- `AF.GetDropdownItems_Arrangement_Complex()` — line 720
- `AF.GetDropdownItems_Class()` — line 733
- `AF.GetDropdownItems_FrameStrata(allStratas)` — line 743

### [Widgets/EditBox.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/EditBox.lua)

TOC: enabled.

- `AF_EditBoxMixin:SetConfirmButton(func, text, position, width, height)` — line 18
- `AF_EditBoxMixin:SetOnEditFocusGained(func)` — line 64
- `AF_EditBoxMixin:SetOnEditFocusLost(func)` — line 69
- `AF_EditBoxMixin:SetOnEnterPressed(func)` — line 74
- `AF_EditBoxMixin:SetOnEscapePressed(func)` — line 79
- `AF_EditBoxMixin:SetOnTextChanged(func)` — line 84
- `AF_EditBoxMixin:Clear()` — line 88
- `AF_EditBoxMixin:GetBytes()` — line 92
- `AF_EditBoxMixin:SetMode(mode)` — line 99
- `AF_EditBoxMixin:GetValue()` — line 147
- `AF_EditBoxMixin:SetNotUserChangable(notUserChangable)` — line 151
- `AF_EditBoxMixin:SetBorderColor(color)` — line 156
- `AF_EditBoxMixin:SetLabel(label)` — line 171
- `AF_EditBoxMixin:SetLabelAlt(label)` — line 177
- `AF.CreateEditBox(parent, label, width, height, mode, font)` — line 282
- `AF_ScrollEditBoxMixin:SetText(text)` — line 338
- `AF_ScrollEditBoxMixin:GetText()` — line 344
- `AF_ScrollEditBoxMixin:GetValue()` — line 348
- `AF_ScrollEditBoxMixin:Clear()` — line 352
- `AF_ScrollEditBoxMixin:SetCursorPosition(position)` — line 359
- `AF_ScrollEditBoxMixin:IsEnabled()` — line 363
- `AF_ScrollEditBoxMixin:SetEnabled(enabled)` — line 367
- `AF_ScrollEditBoxMixin:SetOnEditFocusGained(func)` — line 385
- `AF_ScrollEditBoxMixin:SetOnEditFocusLost(func)` — line 389
- `AF_ScrollEditBoxMixin:SetOnEnterPressed(func)` — line 393
- `AF_ScrollEditBoxMixin:SetOnEscapePressed(func)` — line 397
- `AF_ScrollEditBoxMixin:SetOnTextChanged(func)` — line 402
- `AF_ScrollEditBoxMixin:SetConfirmButton(func, text, position, width, height)` — line 412
- `AF_ScrollEditBoxMixin:SetMaxLetters(maxLetters)` — line 434
- `AF_ScrollEditBoxMixin:SetMaxBytes(maxBytes)` — line 438
- `AF_ScrollEditBoxMixin:GetBytes()` — line 442
- `AF_ScrollEditBoxMixin:Clear()` — line 446
- `AF_ScrollEditBoxMixin:SetNotUserChangable(notUserChangable)` — line 450
- `AF_ScrollEditBoxMixin:SetFocus()` — line 454
- `AF_ScrollEditBoxMixin:ClearFocus()` — line 458
- `AF_ScrollEditBoxMixin:HasFocus()` — line 462
- `AF_ScrollEditBoxMixin:SetAutoFocus(autoFocus)` — line 466
- `AF_ScrollEditBoxMixin:IsAutoFocus()` — line 470
- `AF_ScrollEditBoxMixin:SetTextColor(...)` — line 474
- `AF_ScrollEditBoxMixin:HighlightText(start, stop)` — line 480
- `AF_ScrollEditBoxMixin:SetLabel(label)` — line 485
- `AF_ScrollEditBoxMixin:SetLabelAlt(label)` — line 490
- `AF_ScrollEditBoxMixin:SetSpacing(spacing)` — line 495
- `AF_ScrollEditBoxMixin:Insert(text)` — line 499
- `AF_ScrollEditBoxMixin:EnableCodeIndentation()` — line 504
- `AF.CreateScrollEditBox(parent, name, label, width, height)` — line 632
- `AF.GetEditBox(parent, label, width, height, mode, font)` — line 751

### [Widgets/Font.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Font.lua)

TOC: enabled.

- `AF.UpdateBaseFont(font)` — line 89
- `AF.AddToFontSizeUpdater(fontObj, originalSize)` — line 110
- `AF.UpdateFontSize(delta)` — line 127
- `AF.AddToFontSizeUpdaterGroup(group, fontObj, originalSize)` — line 157
- `AF.UpdateFontSizeForGroup(group, delta)` — line 167
- `AF.CreateFont(group, name, font, size, flags, shadow, color, justifyH, justifyV)` — line 186
- `AF.GetFontProps(font)` — line 258

Assigned exports/fields: `AF.fontSizeDelta`.

### [Widgets/FontString.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/FontString.lua)

TOC: enabled.

- `AF_FontStringMixin:SetColor(color)` — line 11
- `AF_FontStringMixin:AppendText(text)` — line 16
- `AF.CreateFontString(parent, text, color, font, layer)` — line 31
- `AF.GetStringSize(text, fontFile, fontSize, fontFlag, fontShadow)` — line 61
- `AF.GetFontStringSize(fs)` — line 73
- `AF.ResizeToFitText(frame, fontString, hPadding, vPadding, callback, callbackDelay)` — line 125
- `AF.TruncateFontStringByWidth(fs, width, alignment, showEllipsis, text)` — line 139
- `AF.TruncateFontStringByLength(fs, enChars, nonEnChars, text)` — line 181
- `AF.ShowNotificationText(text, color, width, hideDelay, point, relativeTo, relativePoint, offsetX, offsetY)` — line 251
- `AF_ScrollingTextMixin:SetText(str, color)` — line 284
- `AF_ScrollingTextMixin:ShowUp(skipFadeIn)` — line 331
- `AF_ScrollingTextMixin:Pause()` — line 342
- `AF_ScrollingTextMixin:Resume()` — line 346
- `AF_ScrollingTextMixin:UpdatePixels()` — line 350
- `AF.CreateScrollingText(parent, frequency, step, startDelay, endDelay)` — line 364
- `AF.SetText(fs, text, length, prefix, suffix, relativeTo)` — line 440
- `AF.RainbowText_Start(fs, interval, speed, reverse)` — line 505
- `AF.RainbowText_Stop(fs)` — line 545
- `AF.RainbowText_Pause(fs)` — line 555
- `AF.RainbowText_Resume(fs)` — line 561
- `AF.FlowText_Start(fs, color1, color2, mult, interval, speed, reverse)` — line 612
- `AF.FlowText_Stop(fs)` — line 654
- `AF.FlowText_Pause(fs)` — line 664
- `AF.FlowText_Resume(fs)` — line 670

### [Widgets/Frame.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Frame.lua)

TOC: enabled.

- `AF.CreateFrame(parent, name, width, height, template)` — line 16
- `AF_HeaderedFrameMixin:SetTitleJustify(justify)` — line 32
- `AF_HeaderedFrameMixin:SetTitleColor(color)` — line 48
- `AF_HeaderedFrameMixin:SetTitle(text)` — line 53
- `AF_HeaderedFrameMixin:SetTitleBackgroundColor(color)` — line 58
- `AF_HeaderedFrameMixin:SetTitle(title)` — line 64
- `AF_HeaderedFrameMixin:SetMovable(movable)` — line 68
- `AF_HeaderedFrameMixin:UpdatePixels()` — line 86
- `AF.CreateHeaderedFrame(parent, name, title, width, height, frameStrata, frameLevel, notUserPlaced)` — line 112
- `AF_BorderedFrameMixin:SetLabel(label, fontColor, font, isInside)` — line 211
- `AF_BorderedFrameMixin:SetBorderColor(color)` — line 228
- `AF_BorderedFrameMixin:SetBackgroundColor(color)` — line 239
- `AF.CreateBorderedFrame(parent, name, width, height, color, borderColor)` — line 256
- `AF_TitledPaneMixin:SetTitle(title)` — line 277
- `AF_TitledPaneMixin:UpdatePixels()` — line 281
- `AF_TitledPaneMixin:SetTips(...)` — line 291
- `AF.CreateTitledPane(parent, title, width, height, color)` — line 310
- `AF.CreateMask(parent)` — line 349
- `AF.ShowMask(parent, text, tlX, tlY, brX, brY)` — line 372
- `AF.HideMask(parent)` — line 393
- `AF_CooldownMixin:Start(duration)` — line 405
- `AF_CooldownMixin:StartSince(start, duration)` — line 409
- `AF_CooldownMixin:SetOnCooldownDone(func)` — line 413
- `AF.CreateCooldown(parent, name, texture, color, reverse)` — line 423
- `AF_FlipBookMixin:Play()` — line 459
- `AF_FlipBookMixin:Stop()` — line 463
- `AF_FlipBookMixin:Pause()` — line 467
- `AF_FlipBookMixin:Restart()` — line 471
- `AF_FlipBookMixin:IsPlaying()` — line 475
- `AF_FlipBookMixin:SetTexture(texture)` — line 479
- `AF_FlipBookMixin:SetFlipBookInfo(duration, rows, columns, frames, width, height)` — line 495
- `AF.CreateFlipBookFrame(parent, createMask, template)` — line 508
- `AF.ApplyCombatProtectionToFrame(frame, tlX, tlY, brX, brY)` — line 574
- `AF.RemoveCombatProtectionFromFrame(frame)` — line 605
- `AF.ApplyCombatProtectionToWidget(widget)` — line 620
- `AF.RegisterCombatHiddenFrame(frame)` — line 643
- `AF.UnregisterCombatHiddenFrame(frame)` — line 650

### [Widgets/Glow.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Glow.lua)

TOC: enabled.

- `AF.CreateGlow(parent, color, size)` — line 11
- `AF.ShowNormalGlow(parent, color, size, autoHide)` — line 35
- `AF.HideNormalGlow(parent)` — line 75
- `AF.ShowCalloutGlow(parent, blink, autoHide, relativeFrameLevel)` — line 88
- `AF.HideCalloutGlow(parent)` — line 110

### [Widgets/HelpTip.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/HelpTip.lua)

TOC: enabled.

- `AF_HelpTipMixin:OnShow()` — line 10
- `AF_HelpTipMixin:Close()` — line 21
- `AF_HelpTipMixin:Next()` — line 29
- `AF_HelpTipMixin:SetText(text)` — line 37
- `AF.ShowHelpTip(info)` — line 190
- `AF.ShowHelpTipGroup(tips)` — line 268
- `AF.HideAllHelpTips()` — line 282

### [Widgets/ImagePane.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/ImagePane.lua)

TOC: enabled.

- `AF_ImagePaneMixin:LoadImage(path)` — line 162
- `AF_ImagePaneMixin:LoadImageSequence(path, nameFormat, startIndex, endIndex, interval)` — line 182
- `AF_ImagePaneMixin:LoadFlipBook(path, rows, columns, frames, duration)` — line 223
- `AF_ImagePaneMixin:Reload()` — line 253
- `AF_ImagePaneMixin:Clear()` — line 265
- `AF_ImagePaneMixin:SetDisplayMode(displayMode)` — line 296
- `AF_ImagePaneMixin:SetExpandable(expandable)` — line 302
- `AF_ImagePaneMixin:SetLoadedCallback(callback)` — line 308
- `AF_ImagePaneMixin:EnableImageViewer(enabled)` — line 339
- `AF.CreateImagePane(parent, padding, displayMode, expandable)` — line 355

### [Widgets/ImageViewer.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/ImageViewer.lua)

TOC: enabled.

- `AF.PreloadTexture(path)` — line 22
- `AF_ImageViewerMixin:LoadImage(path, windowWidth, windowHeight)` — line 319
- `AF_ImageViewerMixin:LoadImageSequence(path, nameFormat, startIndex, endIndex, interval, windowWidth, windowHeight)` — line 352
- `AF_ImageViewerMixin:LoadFlipBook(path, rows, columns, frames, duration, windowWidth, windowHeight)` — line 407
- `AF.ImageViewer_LoadImage(path, windowWidth, windowHeight)` — line 496
- `AF.ImageViewer_LoadImageSequence(path, nameFormat, startIndex, endIndex, interval, windowWidth, windowHeight)` — line 509
- `AF.ImageViewer_LoadFlipBook(path, rows, columns, frames, duration, windowWidth, windowHeight)` — line 520

### [Widgets/Misc.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Misc.lua)

TOC: enabled.

- `AF.CreateNetStatsPane(parent, anchorPoint, showBandwidth, showLatency, layout)` — line 10
- `AF.CreateFPSPane(parent, anchorPoint)` — line 84

### [Widgets/Mover.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Mover.lua)

TOC: enabled.

- `AF.InitMoverParent()` — line 192
- `AF.CalcPoint(owner)` — line 220
- `AF.CreateMover(owner, group, text, save)` — line 609
- `AF.UpdateMoverSave(owner, save)` — line 768
- `AF.ShowMovers(group)` — line 776
- `AF.HideMovers()` — line 800
- `AF.ToggleMovers()` — line 813
- `AF.UndoMovers()` — line 822

### [Widgets/Popup.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Popup.lua)

TOC: enabled.

- `AF.ShowNotificationPopup(text, timeout, icon, sound, width, justify, onClick, ...)` — line 523
- `AF.ShowConfirmPopup(text, onConfirm, onCancel, icon, sound, width, justify, onClick, ...)` — line 553
- `AF.ShowProgressPopup(text, maxValue, icon, sound, width, justify, onClick, ...)` — line 582
- `AF.SetupPopups(config)` — line 607

### [Widgets/Scroll.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Scroll.lua)

TOC: enabled.

- `AF_ScrollFrameMixin:ResetHeight()` — line 46
- `AF_ScrollFrameMixin:ResetScroll()` — line 51
- `AF_ScrollFrameMixin:GetVerticalScrollRange()` — line 56
- `AF_ScrollFrameMixin:CanScroll()` — line 61
- `AF_ScrollFrameMixin:VerticalScroll(step)` — line 80
- `AF_ScrollFrameMixin:ScrollToBottom()` — line 93
- `AF_ScrollFrameMixin:SetContentHeight(height, useRawValue, skipScrollReset)` — line 99
- `AF_ScrollFrameMixin:SetContentHeights(heights, spacing)` — line 112
- `AF_ScrollFrameMixin:SetScrollStep(step)` — line 118
- `AF_ScrollFrameMixin:GetScrollStep()` — line 122
- `AF_ScrollFrameMixin:SetScroll(offset)` — line 126
- `AF_ScrollFrameMixin:GetScroll()` — line 130
- `AF_ScrollFrameMixin:Reset()` — line 134
- `AF_ScrollFrameMixin:UpdatePixels()` — line 144
- `AF_ScrollFrameMixin:DisableScrollFrameReanchor(disabled)` — line 161
- `AF_ScrollFrameMixin:EnableScroll(enabled)` — line 268
- `AF.CreateScrollFrame(parent, name, width, height, color, borderColor)` — line 283
- `AF_ScrollListMixin:UpdateSlotSize()` — line 407
- `AF_ScrollListMixin:UpdateSlots()` — line 419
- `AF_ScrollListMixin:SetSlotNum(newSlotNum)` — line 464
- `AF_ScrollListMixin:SetSlotHeight(newHeight)` — line 469
- `AF_ScrollListMixin:DisableSlotFrameReanchor(disabled)` — line 474
- `AF_ScrollListMixin:SetWidgets(widgets, scrollTo)` — line 494
- `AF_ScrollListMixin:SetWidgetPool(pool)` — line 512
- `AF_ScrollListMixin:SetData(data, scrollTo)` — line 526
- `AF_ScrollListMixin:Reset()` — line 548
- `AF_ScrollListMixin:SetScroll(startIndex)` — line 589
- `AF_ScrollListMixin:ScrollTo(index)` — line 681
- `AF_ScrollListMixin:ScrollToID(id)` — line 692
- `AF_ScrollListMixin:ScrollToBottom()` — line 700
- `AF_ScrollListMixin:GetScroll()` — line 704
- `AF_ScrollListMixin:GetWidgetAt(index)` — line 712
- `AF_ScrollListMixin:GetWidgets()` — line 718
- `AF_ScrollListMixin:GetScrollRange()` — line 726
- `AF_ScrollListMixin:CanScroll()` — line 731
- `AF_ScrollListMixin:SetScrollStep(step)` — line 735
- `AF_ScrollListMixin:Select(id, skipCallback)` — line 764
- `AF_ScrollListMixin:InvertSelect()` — line 834
- `AF_ScrollListMixin:SelectAll()` — line 847
- `AF_ScrollListMixin:GetSelected()` — line 858
- `AF_ScrollListMixin:SetMultiSelect(enabled, checkGrayOut)` — line 865
- `AF_ScrollListMixin:ClearSelected()` — line 876
- `AF_ScrollListMixin:InitButtonScripts(b)` — line 889
- `AF_ScrollListMixin:SetupButtonGroup(color, onSelect, onDeselect, onEnter, onLeave, onLoad)` — line 926
- `AF_ScrollListMixin:UpdatePixels()` — line 960
- `AF.CreateScrollList(parent, name, verticalMargin, horizontalMargin, slotNum, slotHeight, slotSpacing, color, borderColor)` — line 992
- `AF_ScrollGridMixin:UpdateSlotPoint()` — line 1065
- `AF_ScrollGridMixin:UpdateSlotSize()` — line 1078
- `AF_ScrollGridMixin:UpdateSlots()` — line 1097
- `AF_ScrollGridMixin:SetSlotRowsAndColumns(newSlotRow, newSlotColumn)` — line 1127
- `AF_ScrollGridMixin:SetSlotSize(newWidth, newHeight)` — line 1135
- `AF_ScrollGridMixin:DisableSlotFrameReanchor(disabled)` — line 1141
- `AF_ScrollGridMixin:SetWidgets(widgets)` — line 1146
- `AF_ScrollGridMixin:Reset()` — line 1171
- `AF_ScrollGridMixin:SetScroll(startRow)` — line 1193
- `AF_ScrollGridMixin:ScrollToBottom()` — line 1253
- `AF_ScrollGridMixin:GetScroll()` — line 1257
- `AF_ScrollGridMixin:GetWidgetAt(index)` — line 1265
- `AF_ScrollGridMixin:GetWidgets()` — line 1271
- `AF_ScrollGridMixin:GetScrollRange()` — line 1275
- `AF_ScrollGridMixin:CanScroll()` — line 1280
- `AF_ScrollGridMixin:SetScrollStep(step)` — line 1284
- `AF_ScrollGridMixin:UpdatePixels()` — line 1288
- `AF.CreateScrollGrid(parent, name, verticalMargin, horizontalMargin, slotColumn, slotRow, slotWidth, slotHeight, slotSpacing, color, borderColor)` — line 1318

### [Widgets/Sheet.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Sheet.lua)

TOC: enabled.

- `AF_SheetMixin:Sort(keys)` — line 79
- `AF_SheetMixin:Setup(config)` — line 199
- `AF_SheetMixin:LoadRow(row, data)` — line 215
- `AF_SheetMixin:LoadData(data)` — line 223
- `AF_SheetMixin:GetRowByIndex(index)` — line 249
- `AF_SheetMixin:GetRowByKeyValue(key, value)` — line 255
- `AF_SheetMixin:SetShownColumns(columns)` — line 269
- `AF.CreateSheet(parent, name, config, onSizeChanged)` — line 350

### [Widgets/Slider.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Slider.lua)

TOC: enabled.

- `AF_SliderMixin:GetValue()` — line 12
- `AF_SliderMixin:SetValue(value)` — line 17
- `AF_SliderMixin:SetMinMaxValues(minV, maxV)` — line 24
- `AF_SliderMixin:SetPercentage(isPercentage)` — line 33
- `AF_SliderMixin:SetStep(step)` — line 43
- `AF_SliderMixin:SetLabel(text)` — line 48
- `AF_SliderMixin:SetLowHighTextShown(show)` — line 52
- `AF_SliderMixin:SetEditBoxShown(show)` — line 62
- `AF_SliderMixin:SetOnValueChanged(func)` — line 72
- `AF_SliderMixin:SetAfterValueChanged(func)` — line 78
- `AF_SliderMixin:OnMouseWheel(delta)` — line 83
- `AF_SliderMixin:EnableMouseWheel(enabled)` — line 103
- `AF_SliderMixin:SetTooltip(...)` — line 113
- `AF.CreateSlider(parent, text, width, low, high, step, isPercentage, showLowHighText)` — line 230
- `AF_VerticalSliderMixin:SetValue(value)` — line 349
- `AF_VerticalSliderMixin:UpdateWordWrap(wordWrapWidth)` — line 358
- `AF_VerticalSliderMixin:SetTooltip(...)` — line 372
- `AF.CreateVerticalSlider(parent, text, height, low, high, step, isPercentage, showLowHighText)` — line 429

### [Widgets/SmoothStatusBarMixin.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/SmoothStatusBarMixin.lua)

TOC: enabled.

- `AF_SmoothStatusBarMixin:ResetSmoothedValue(value)` — line 37
- `AF_SmoothStatusBarMixin:SetSmoothedValue(value)` — line 47
- `AF_SmoothStatusBarMixin:SetMinMaxSmoothedValue(min, max)` — line 51

### [Widgets/StatusBar.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/StatusBar.lua)

TOC: enabled.

- `AF.StartStatusBarCountdown(bar, totalTime, timeRemaining, onFinish)` — line 14
- `AF.StopStatusBarCountdown(bar)` — line 32
- `AF_BlizzardStatusBarMixin:SetBarValue(v)` — line 42
- `AF_BlizzardStatusBarMixin:SetMinMaxValues(minValue, maxValue)` — line 46
- `AF_BlizzardStatusBarMixin:UpdatePixels()` — line 53
- `AF.CreateBlizzardStatusBar(parent, minValue, maxValue, width, height, color, borderColor, progressTextType)` — line 70
- `AF_BaseStatusBarMixin:SetTexture(fillTexture, unfillTexture, wrapModeHorizontal, wrapModeVertical, filterMode)` — line 133
- `AF_BaseStatusBarMixin:LSM_SetTexture(fillTexture, unfillTexture, wrapModeHorizontal, wrapModeVertical, filterMode)` — line 138
- `AF_BaseStatusBarMixin:SetFillColor(r, g, b, a)` — line 144
- `AF_BaseStatusBarMixin:SetGradientFillColor(orientation, ...)` — line 150
- `AF_BaseStatusBarMixin:SetUnfillColor(r, g, b, a)` — line 160
- `AF_BaseStatusBarMixin:SetGradientUnfillColor(orientation, ...)` — line 166
- `AF_BaseStatusBarMixin:SetBackgroundColor(r, g, b, a)` — line 191
- `AF_BaseStatusBarMixin:SetBorderColor(r, g, b, a)` — line 195
- `AF_BaseStatusBarMixin:EnableBorder(enabled)` — line 199
- `AF_BaseStatusBarMixin:SetOrientation(orientation)` — line 210
- `AF_BaseStatusBarMixin:SetTextureQuarterRotations(quarterRotations)` — line 247
- `AF_BaseStatusBarMixin:Reset()` — line 256
- `AF_BaseStatusBarMixin:GetBarSize()` — line 260
- `AF_BaseStatusBarMixin:GetBarWidth()` — line 264
- `AF_BaseStatusBarMixin:GetBarHeight()` — line 268
- `AF_BaseStatusBarMixin:DefaultUpdatePixels()` — line 272
- `AF_SimpleStatusBarMixin:SetOrientation(orientation)` — line 319
- `AF_SimpleStatusBarMixin:SetSmoothing(smoothing)` — line 353
- `AF_SimpleStatusBarMixin:GetMinMaxValues()` — line 365
- `AF_SimpleStatusBarMixin:GetValue()` — line 369
- `AF_SimpleStatusBarMixin:GetRemainingValue()` — line 373
- `AF_SimpleStatusBarMixin:SetMinMaxValues(min, max)` — line 378
- `AF_SimpleStatusBarMixin:SetValue(value)` — line 384
- `AF_SimpleStatusBarMixin:Dim(enabled)` — line 390
- `AF.CreateSimpleStatusBar(parent, name, noBackdrop)` — line 395

### [Widgets/Texture.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Texture.lua)

TOC: enabled.

- `AF.IsAtlas(atlas)` — line 5
- `AF_TextureMixin:SetColor(color)` — line 16
- `AF_TextureMixin:SetTextureOrAtlas(texture, ...)` — line 29
- `AF_TextureMixin:HasTexture()` — line 40
- `AF.CreateTexture(parent, texture, color, drawLayer, subLevel, wrapModeHorizontal, wrapModeVertical, filterMode)` — line 63
- `AF.GetDefaultTexCoord()` — line 94
- `AF.ApplyDefaultTexCoord(tex)` — line 100
- `AF.ClearTexCoord(tex)` — line 105
- `AF.CalcTexCoordPreCrop(crop, targetAspectRatio, originalAspectRatio, anchor, unpack)` — line 119
- `AF.CalcScale(originalWidth, originalHeight, targetWidth, targetHeight, crop)` — line 182
- `AF_GradientTextureMixin:SetColor(orientation, color1, color2)` — line 201
- `AF.CreateGradientTexture(parent, orientation, color1, color2, texture, drawLayer, subLevel, filterMode)` — line 213
- `AF_SeparatorMixin:SetColor(color1, color2)` — line 235
- `AF.CreateSeparator(parent, size, thickness, color1, color2, isVertical, noShadow)` — line 275
- `AF_IconMixin:SetBackgroundColor(color)` — line 324
- `AF_IconMixin:SetIcon(icon, isAtlas)` — line 332
- `AF_IconMixin:SetIconTexCoord(left, right, top, bottom)` — line 340
- `AF_IconMixin:UpdatePixels()` — line 344
- `AF.CreateIcon(parent, icon, size, bgColor)` — line 355

### [Widgets/TimeFormat.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/TimeFormat.lua)

TOC: enabled.

- `AF_TimeFormatBoxMixin:SetValue(value)` — line 129
- `AF_TimeFormatBoxMixin:SetOnFormatChanged(onFormatChanged)` — line 134
- `AF.CreateTimeFormatBox(parent, width, tipsPosition)` — line 158

### [Widgets/Tooltip.lua](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/Tooltip.lua)

TOC: enabled.

- `AF.ShowTooltip(widget, anchor, x, y, lines)` — line 28
- `AF.SetTooltip(widget, anchor, x, y, ...)` — line 80
- `AF.ClearTooltip(widget)` — line 103
- `AF.HideTooltip(hideAll)` — line 108
- `AF_TooltipMixin:SetOwner(owner, ...)` — line 191
- `AF_TooltipMixin:UpdatePixels()` — line 198
- `AF_TooltipMixin:OnHide()` — line 206
- `AF_TooltipMixin:OnShow()` — line 225
- `AF_TooltipMixin:RequireModifier(modifier)` — line 231
- `AF_TooltipMixin:SetItemByID(itemID, showIcon)` — line 237
- `AF_TooltipMixin:SetSpellByID(spellID, showIcon)` — line 266
- `AF_TooltipMixin:SetupIcon(point, relativePoint, x, y)` — line 290
- `AF_TooltipMixin:ShowIcon()` — line 314
- `AF_TooltipMixin:HideIcon()` — line 322

Assigned exports/fields: `AF.Tooltip`, `AF.Tooltip2`.

### [Widgets/TooltipTemplate.xml](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/TooltipTemplate.xml)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

### [Widgets/TooltipTemplate_Classic.xml](https://github.com/enderneko/AbstractFramework/blob/6b2b2fedd8c27cc85370cb78991d32cb2a1c380f/Widgets/TooltipTemplate_Classic.xml)

TOC: enabled.

Data, internal helpers, templates or declarations without a direct AF export.

## Media assets

Each upstream asset requires a procedural/native replacement decision; an inventory entry does not imply image-loading support.

- `Media/Calendar/Calendar_Day_1.tga` (1046 bytes)
- `Media/Calendar/Calendar_Day_10.tga` (2093 bytes)
- `Media/Calendar/Calendar_Day_11.tga` (1634 bytes)
- `Media/Calendar/Calendar_Day_12.tga` (1786 bytes)
- `Media/Calendar/Calendar_Day_13.tga` (1948 bytes)
- `Media/Calendar/Calendar_Day_14.tga` (1904 bytes)
- `Media/Calendar/Calendar_Day_15.tga` (1880 bytes)
- `Media/Calendar/Calendar_Day_16.tga` (1962 bytes)
- `Media/Calendar/Calendar_Day_17.tga` (1714 bytes)
- `Media/Calendar/Calendar_Day_18.tga` (2174 bytes)
- `Media/Calendar/Calendar_Day_19.tga` (1991 bytes)
- `Media/Calendar/Calendar_Day_2.tga` (1321 bytes)
- `Media/Calendar/Calendar_Day_20.tga` (2300 bytes)
- `Media/Calendar/Calendar_Day_21.tga` (1901 bytes)
- `Media/Calendar/Calendar_Day_22.tga` (2090 bytes)
- `Media/Calendar/Calendar_Day_23.tga` (2157 bytes)
- `Media/Calendar/Calendar_Day_24.tga` (2106 bytes)
- `Media/Calendar/Calendar_Day_25.tga` (2073 bytes)
- `Media/Calendar/Calendar_Day_26.tga` (2192 bytes)
- `Media/Calendar/Calendar_Day_27.tga` (1910 bytes)
- `Media/Calendar/Calendar_Day_28.tga` (2386 bytes)
- `Media/Calendar/Calendar_Day_29.tga` (2163 bytes)
- `Media/Calendar/Calendar_Day_3.tga` (1402 bytes)
- `Media/Calendar/Calendar_Day_30.tga` (2357 bytes)
- `Media/Calendar/Calendar_Day_31.tga` (1973 bytes)
- `Media/Calendar/Calendar_Day_4.tga` (1345 bytes)
- `Media/Calendar/Calendar_Day_5.tga` (1307 bytes)
- `Media/Calendar/Calendar_Day_6.tga` (1393 bytes)
- `Media/Calendar/Calendar_Day_7.tga` (1160 bytes)
- `Media/Calendar/Calendar_Day_8.tga` (1586 bytes)
- `Media/Calendar/Calendar_Day_9.tga` (1402 bytes)
- `Media/Calendar/Calendar_Month_1.tga` (2699 bytes)
- `Media/Calendar/Calendar_Month_10.tga` (2341 bytes)
- `Media/Calendar/Calendar_Month_11.tga` (3106 bytes)
- `Media/Calendar/Calendar_Month_12.tga` (2350 bytes)
- `Media/Calendar/Calendar_Month_2.tga` (2292 bytes)
- `Media/Calendar/Calendar_Month_3.tga` (3176 bytes)
- `Media/Calendar/Calendar_Month_4.tga` (2691 bytes)
- `Media/Calendar/Calendar_Month_5.tga` (3216 bytes)
- `Media/Calendar/Calendar_Month_6.tga` (2825 bytes)
- `Media/Calendar/Calendar_Month_7.tga` (2238 bytes)
- `Media/Calendar/Calendar_Month_8.tga` (2786 bytes)
- `Media/Calendar/Calendar_Month_9.tga` (2251 bytes)
- `Media/Calendar/Calendar_Weekday_1.tga` (1920 bytes)
- `Media/Calendar/Calendar_Weekday_2.tga` (2540 bytes)
- `Media/Calendar/Calendar_Weekday_3.tga` (1804 bytes)
- `Media/Calendar/Calendar_Weekday_4.tga` (2379 bytes)
- `Media/Calendar/Calendar_Weekday_5.tga` (1785 bytes)
- `Media/Calendar/Calendar_Weekday_6.tga` (1851 bytes)
- `Media/Calendar/Calendar_Weekday_7.tga` (1875 bytes)
- `Media/Fonts/Accidental_Presidency.ttf` (41556 bytes)
- `Media/Fonts/CalSans-OFL.txt` (4474 bytes)
- `Media/Fonts/CalSans.ttf` (101592 bytes)
- `Media/Fonts/Dolphin.ttf` (64492 bytes)
- `Media/Fonts/Emblem.ttf` (33204 bytes)
- `Media/Fonts/Expressway.ttf` (99820 bytes)
- `Media/Fonts/Glyphs.ttf` (9376 bytes)
- `Media/Fonts/Markers.ttf` (5652 bytes)
- `Media/Fonts/NotoSansCJKsc_AP.ttf` (16830516 bytes)
- `Media/Fonts/NotoSansCJKsc_Dolphin.ttf` (16844472 bytes)
- `Media/Fonts/NotoSansCJKsc_OFL.txt` (4887 bytes)
- `Media/Fonts/Unifont.otf` (5320880 bytes)
- `Media/Fonts/source.txt` (50 bytes)
- `Media/Fonts/visitor.ttf` (27552 bytes)
- `Media/Icons/AF.tga` (8472 bytes)
- `Media/Icons/AlignTextLeft.tga` (936 bytes)
- `Media/Icons/AlignTextRight.tga` (936 bytes)
- `Media/Icons/Anchor_BOTTOM.tga` (1461 bytes)
- `Media/Icons/Anchor_BOTTOMLEFT.tga` (1456 bytes)
- `Media/Icons/Anchor_BOTTOMRIGHT.tga` (1624 bytes)
- `Media/Icons/Anchor_CENTER.tga` (2545 bytes)
- `Media/Icons/Anchor_LEFT.tga` (1202 bytes)
- `Media/Icons/Anchor_RIGHT.tga` (1109 bytes)
- `Media/Icons/Anchor_TOP.tga` (1176 bytes)
- `Media/Icons/Anchor_TOPLEFT.tga` (1197 bytes)
- `Media/Icons/Anchor_TOPRIGHT.tga` (1098 bytes)
- `Media/Icons/ArrowDoubleDown.tga` (2767 bytes)
- `Media/Icons/ArrowDown1.tga` (1447 bytes)
- `Media/Icons/ArrowDown2.tga` (811 bytes)
- `Media/Icons/ArrowDown_Small.tga` (1128 bytes)
- `Media/Icons/ArrowDown_Square.tga` (1280 bytes)
- `Media/Icons/ArrowLeft1.tga` (1485 bytes)
- `Media/Icons/ArrowLeft2.tga` (1211 bytes)
- `Media/Icons/ArrowRight1.tga` (1515 bytes)
- `Media/Icons/ArrowRight2.tga` (1314 bytes)
- `Media/Icons/ArrowUp1.tga` (1172 bytes)
- `Media/Icons/ArrowUp2.tga` (916 bytes)
- `Media/Icons/ArrowUp_Small.tga` (1488 bytes)
- `Media/Icons/Calendar.tga` (1984 bytes)
- `Media/Icons/Chat.tga` (1592 bytes)
- `Media/Icons/Circle.tga` (2922 bytes)
- `Media/Icons/Circle_Filled.tga` (1998 bytes)
- `Media/Icons/Clock_Round.tga` (2678 bytes)
- `Media/Icons/Clock_Square.tga` (1206 bytes)
- `Media/Icons/Close.tga` (1888 bytes)
- `Media/Icons/Close_Round.tga` (3311 bytes)
- `Media/Icons/Close_Square.tga` (1890 bytes)
- `Media/Icons/ColorPickerRing.tga` (1042 bytes)
- `Media/Icons/Create_Round.tga` (2598 bytes)
- `Media/Icons/Create_Square.tga` (1176 bytes)
- `Media/Icons/Dead.tga` (2704 bytes)
- `Media/Icons/Download.tga` (1596 bytes)
- `Media/Icons/Duplicate.tga` (2211 bytes)
- `Media/Icons/Edit.tga` (2032 bytes)
- `Media/Icons/Erase.tga` (2136 bytes)
- `Media/Icons/Exclamation.tga` (1491 bytes)
- `Media/Icons/Exclamation_Rhombic.tga` (2207 bytes)
- `Media/Icons/Exclamation_Round.tga` (2458 bytes)
- `Media/Icons/Exclamation_Triangular.tga` (1846 bytes)
- `Media/Icons/Export1.tga` (1863 bytes)
- `Media/Icons/Export2.tga` (1410 bytes)
- `Media/Icons/Faction2_Alliance.tga` (15017 bytes)
- `Media/Icons/Faction2_Horde.tga` (10821 bytes)
- `Media/Icons/Faction_Alliance.tga` (8478 bytes)
- `Media/Icons/Faction_Horde.tga` (5084 bytes)
- `Media/Icons/Fluent_Alert.tga` (6489 bytes)
- `Media/Icons/Fluent_Color_Globe.tga` (10028 bytes)
- `Media/Icons/Fluent_Color_Home.tga` (4123 bytes)
- `Media/Icons/Fluent_Color_No.tga` (6487 bytes)
- `Media/Icons/Fluent_Color_Unavailable.tga` (7802 bytes)
- `Media/Icons/Fluent_Color_Yes.tga` (3587 bytes)
- `Media/Icons/Fluent_Notice.tga` (8447 bytes)
- `Media/Icons/Fluent_Tools.tga` (4997 bytes)
- `Media/Icons/Frame1.tga` (1016 bytes)
- `Media/Icons/Frame2.tga` (1956 bytes)
- `Media/Icons/Home.tga` (2131 bytes)
- `Media/Icons/Import1.tga` (1703 bytes)
- `Media/Icons/Import2.tga` (1410 bytes)
- `Media/Icons/Info_Round.tga` (2458 bytes)
- `Media/Icons/Info_Square.tga` (1036 bytes)
- `Media/Icons/Layers.tga` (2473 bytes)
- `Media/Icons/Layout.tga` (3211 bytes)
- `Media/Icons/Link.tga` (1773 bytes)
- `Media/Icons/Mark.tga` (1042 bytes)
- `Media/Icons/Menu1.tga` (831 bytes)
- `Media/Icons/Menu2.tga` (936 bytes)
- `Media/Icons/Menu3.tga` (896 bytes)
- `Media/Icons/Menu4.tga` (1826 bytes)
- `Media/Icons/Minus.tga` (651 bytes)
- `Media/Icons/Minus_Small.tga` (621 bytes)
- `Media/Icons/MouseLeftClick.tga` (1623 bytes)
- `Media/Icons/MouseRightClick.tga` (1628 bytes)
- `Media/Icons/NoImage.tga` (3427 bytes)
- `Media/Icons/OK.tga` (2066 bytes)
- `Media/Icons/Pause.tga` (1616 bytes)
- `Media/Icons/Play.tga` (1567 bytes)
- `Media/Icons/Plus.tga` (1411 bytes)
- `Media/Icons/Plus_Small.tga` (1891 bytes)
- `Media/Icons/Profession_Alchemy.tga` (9386 bytes)
- `Media/Icons/Profession_Archeology.tga` (10274 bytes)
- `Media/Icons/Profession_Blacksmithing.tga` (12727 bytes)
- `Media/Icons/Profession_Cooking.tga` (8280 bytes)
- `Media/Icons/Profession_Enchanting.tga` (16454 bytes)
- `Media/Icons/Profession_Engineering.tga` (12770 bytes)
- `Media/Icons/Profession_FirstAid.tga` (14457 bytes)
- `Media/Icons/Profession_Fishing.tga` (9809 bytes)
- `Media/Icons/Profession_Herbalism.tga` (10473 bytes)
- `Media/Icons/Profession_Inscription.tga` (7122 bytes)
- `Media/Icons/Profession_Jewelcrafting.tga` (12228 bytes)
- `Media/Icons/Profession_Leatherworking.tga` (12062 bytes)
- `Media/Icons/Profession_Mining.tga` (9706 bytes)
- `Media/Icons/Profession_Skinning.tga` (14821 bytes)
- `Media/Icons/Profession_Tailoring.tga` (13437 bytes)
- `Media/Icons/QR_Code.tga` (2581 bytes)
- `Media/Icons/Question.tga` (1989 bytes)
- `Media/Icons/QuestionMark.tga` (9003 bytes)
- `Media/Icons/Question_Round.tga` (2939 bytes)
- `Media/Icons/ReadyCheck_NotReady.tga` (12222 bytes)
- `Media/Icons/ReadyCheck_Ready.tga` (9365 bytes)
- `Media/Icons/ReadyCheck_Waiting.tga` (8489 bytes)
- `Media/Icons/Refresh.tga` (1818 bytes)
- `Media/Icons/Refresh_Round.tga` (2867 bytes)
- `Media/Icons/Rename.tga` (2074 bytes)
- `Media/Icons/Reset_Small.tga` (899 bytes)
- `Media/Icons/Resize.tga` (1972 bytes)
- `Media/Icons/ResizeButton1.tga` (4038 bytes)
- `Media/Icons/ResizeButton2.tga` (6181 bytes)
- `Media/Icons/RoleIcons1.tga` (2321 bytes)
- `Media/Icons/RoleIcons2.tga` (24311 bytes)
- `Media/Icons/RoleIcons3.tga` (31135 bytes)
- `Media/Icons/RoleIcons4.tga` (42421 bytes)
- `Media/Icons/RoleIcons5.tga` (10342 bytes)
- `Media/Icons/RoleIcons6.tga` (4114 bytes)
- `Media/Icons/RoleIcons7.tga` (2463 bytes)
- `Media/Icons/Save.tga` (1351 bytes)
- `Media/Icons/Settings.tga` (2703 bytes)
- `Media/Icons/Share.tga` (2273 bytes)
- `Media/Icons/SmallLock.tga` (1561 bytes)
- `Media/Icons/SourceCode.tga` (2645 bytes)
- `Media/Icons/Star.tga` (5259 bytes)
- `Media/Icons/Star_Filled.tga` (2943 bytes)
- `Media/Icons/Stop.tga` (1221 bytes)
- `Media/Icons/Tick.tga` (1510 bytes)
- `Media/Icons/Transfer.tga` (1917 bytes)
- `Media/Icons/Trash.tga` (2468 bytes)
- `Media/Icons/Unavailable.tga` (6338 bytes)
- `Media/Icons/Upload.tga` (1621 bytes)
- `Media/Icons/WindowMaximize.tga` (1036 bytes)
- `Media/Icons/WindowMinimize.tga` (696 bytes)
- `Media/Icons/WindowRestore.tga` (1091 bytes)
- `Media/Icons/World.tga` (3090 bytes)
- `Media/Icons/Wrench.tga` (1976 bytes)
- `Media/Logos/afdian.tga` (5522 bytes)
- `Media/Logos/bilibili.tga` (10392 bytes)
- `Media/Logos/curseforge.tga` (1004 bytes)
- `Media/Logos/discord.tga` (1364 bytes)
- `Media/Logos/github.tga` (2349 bytes)
- `Media/Logos/ko-fi.tga` (11055 bytes)
- `Media/Logos/kook.tga` (4021 bytes)
- `Media/Logos/nga.tga` (11018 bytes)
- `Media/Logos/wago.tga` (2539 bytes)
- `Media/Sounds/bell.ogg` (16058 bytes)
- `Media/Sounds/ding.ogg` (13083 bytes)
- `Media/Sounds/error.ogg` (18796 bytes)
- `Media/Sounds/notification1.ogg` (20010 bytes)
- `Media/Sounds/notification2.ogg` (22063 bytes)
- `Media/Sounds/pop.ogg` (5840 bytes)
- `Media/Sounds/smooth_alert1.ogg` (20454 bytes)
- `Media/Sounds/smooth_alert2.ogg` (18501 bytes)
- `Media/Sounds/smooth_alert3.ogg` (13032 bytes)
- `Media/Sounds/smooth_alert4.ogg` (16389 bytes)
- `Media/Sounds/smooth_alert5.ogg` (19846 bytes)
- `Media/Sounds/smooth_alert6.ogg` (14194 bytes)
- `Media/Sounds/source.txt` (1011 bytes)
- `Media/Textures/Bar_AF.tga` (5144 bytes)
- `Media/Textures/Bar_Nyan.tga` (856 bytes)
- `Media/Textures/Bar_Underline.tga` (971 bytes)
- `Media/Textures/Bar_pfUI_S.tga` (530 bytes)
- `Media/Textures/Bar_pfUI_U.tga` (274 bytes)
- `Media/Textures/Border.tga` (1864 bytes)
- `Media/Textures/CalloutGlow.tga` (6559 bytes)
- `Media/Textures/CalloutGlowAlt.tga` (6563 bytes)
- `Media/Textures/Checkerboard.tga` (11637 bytes)
- `Media/Textures/Circle.tga` (10775 bytes)
- `Media/Textures/Circle_Soft_Edge.tga` (56155 bytes)
- `Media/Textures/CooldownEdge.tga` (2176 bytes)
- `Media/Textures/Empty.tga` (3211 bytes)
- `Media/Textures/Gradient_Linear_Bottom.tga` (245564 bytes)
- `Media/Textures/Gradient_Linear_BottomLeft.tga` (248848 bytes)
- `Media/Textures/Gradient_Linear_BottomLeftToCenter.tga` (131422 bytes)
- `Media/Textures/Gradient_Linear_BottomRight.tga` (249095 bytes)
- `Media/Textures/Gradient_Linear_BottomRightToCenter.tga` (130727 bytes)
- `Media/Textures/Gradient_Linear_Horizontal_CenterToEdges.tga` (268280 bytes)
- `Media/Textures/Gradient_Linear_Horizontal_EdgesToCenter.tga` (268308 bytes)
- `Media/Textures/Gradient_Linear_Left.tga` (257850 bytes)
- `Media/Textures/Gradient_Linear_Right.tga` (257624 bytes)
- `Media/Textures/Gradient_Linear_Top.tga` (245590 bytes)
- `Media/Textures/Gradient_Linear_TopLeft.tga` (249264 bytes)
- `Media/Textures/Gradient_Linear_TopLeftToCenter.tga` (131215 bytes)
- `Media/Textures/Gradient_Linear_TopRight.tga` (248674 bytes)
- `Media/Textures/Gradient_Linear_TopRightToCenter.tga` (130440 bytes)
- `Media/Textures/Gradient_Linear_Vertical_CenterToEdges.tga` (246070 bytes)
- `Media/Textures/Gradient_Linear_Vertical_EdgesToCenter.tga` (246112 bytes)
- `Media/Textures/Gradient_Radial_BottomLeft.tga` (172415 bytes)
- `Media/Textures/Gradient_Radial_BottomRight.tga` (172692 bytes)
- `Media/Textures/Gradient_Radial_Circle_HalfDiag.tga` (233744 bytes)
- `Media/Textures/Gradient_Radial_Circle_HalfSide.tga` (190427 bytes)
- `Media/Textures/Gradient_Radial_TopLeft.tga` (172478 bytes)
- `Media/Textures/Gradient_Radial_TopRIght.tga` (170565 bytes)
- `Media/Textures/InsetHighlight.tga` (3106 bytes)
- `Media/Textures/Nyan.tga` (20204 bytes)
- `Media/Textures/Ring.tga` (13968 bytes)
- `Media/Textures/Ring_Glow.tga` (123457 bytes)
- `Media/Textures/Square_Soft_Edge.tga` (62199 bytes)
- `Media/Textures/StaticGlow.tga` (7372 bytes)
- `Media/Textures/Stripe.tga` (16428 bytes)
- `Media/Textures/Triangle_BottomLeft.tga` (1280 bytes)
- `Media/Textures/Triangle_BottomRight.tga` (972 bytes)
- `Media/Textures/Triangle_TopLeft.tga` (972 bytes)
- `Media/Textures/Triangle_TopRight.tga` (1280 bytes)
- `Media/Textures/Uninterruptible1.tga` (4114 bytes)
- `Media/Textures/Uninterruptible2.tga` (4114 bytes)
- `Media/Textures/Uninterruptible3.tga` (4114 bytes)
- `Media/Textures/White.tga` (3211 bytes)
- `Media/Textures/White_Half_Bottom.tga` (3211 bytes)
- `Media/Textures/White_Half_Left.tga` (3211 bytes)
- `Media/Textures/White_Half_Right.tga` (3211 bytes)
- `Media/Textures/White_Half_Top.tga` (3211 bytes)

## External dependencies

Upstream packaging metadata (dependencies require their own API/license audit):

```yaml
package-as: AbstractFramework
enable-nolib-creation: no

externals:
  Libs/LibStub: https://repos.curseforge.com/wow/libstub/trunk
  Libs/CallbackHandler-1.0: https://repos.curseforge.com/wow/callbackhandler/trunk/CallbackHandler-1.0
  Libs/AceComm-3.0: https://repos.curseforge.com/wow/ace3/trunk/AceComm-3.0
  Libs/LibSerialize: https://github.com/rossnichols/LibSerialize
  Libs/LibDeflate: https://github.com/SafeteeWoW/LibDeflate
  Libs/LibCustomGlow-1.0: https://github.com/Stanzilla/LibCustomGlow
  Libs/LibSharedMedia-3.0: https://repos.curseforge.com/wow/libsharedmedia-3-0/trunk/LibSharedMedia-3.0
  Libs/LibDataBroker-1.1: https://github.com/tekkub/libdatabroker-1-1
  Libs/LibDBIcon-1.0: https://repos.curseforge.com/wow/libdbicon-1-0/trunk/LibDBIcon-1.0
  Libs/TaintLess:
    url: https://www.townlong-yak.com/addons.git/taintless
    commit: default

ignore:
  - Libs/LibStub/tests
  - Libs/LibStub/LibStub.toc
  - Libs/LibDeflate/docs
  - Libs/LibDeflate/examples
  - Libs/LibDeflate/CONTRIBUTING.md
  - Libs/LibDeflate/changelog.md
  - Libs/LibDeflate/LibDeflate.toc
  - Libs/LibDeflate/README.md
  - Libs/LibCustomGlow-1.0/cspell.json
  - Libs/LibCustomGlow-1.0/LibCustomGlow-1.0.toc
  - Libs/LibCustomGlow-1.0/README.md
  - Libs/LibDataBroker-1.1/README.textile

manual-changelog:
  filename: CHANGELOG.md
  markup-type: markdown
```
