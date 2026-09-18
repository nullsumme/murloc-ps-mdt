<!-- Source: https://docs.nilname.com/Blog/Binance_is_a_scam_change_my_mind/ -->

# Binance is a scam: change my mind

 

**Binance**, one of the biggest cryptocurrency exchanges, **is unknowingly ripping off its customers** when they exit assets from the exchange platform.

 

Almost every day I wake up to Nn support tickets and DMs saying stuff like "Nn not accepted my payment", "Payment missmatch but I send exact amount", and so on.

 

It turns out that, Binance is secretly deducting some arbitrary fee like 0.0001 BTC -- which is about 6.5$ at the time of writing -- on every 'withdraw' you make. Yes, I am using the word 'withdraw' because **Binance is an exchange** platform and **not a wallet**.

 

## How the 'scam' works

 

To transact bitcoins, you need to write a transaction on the blockchain and sign it with private keys. When Binance sends the bitcoin to the Nn address, both Binance and Nn are using Bech32 addresses, these are "Segwit" addresses and are designed to leave a very small footprint on the blockchain to reduce fees. On top of that, Binance is also 'consolidating' multiple transactions into a single transaction -- I guess there are multiple Binance user's requests withdrawals -- causing artificial wait times as Binance is min/maxing the pollution of the blockchain (very nice, Binance)

 

But, after all of these optimizations on the blockchain, Binance is still going to charge u this bogus arbitrary fee of 0.0001 BTC (6.5$). Looking at the Bitcoin blockchain we can see Binance transactions being only 0.0000363 BTC or 2.32$ today. Note that multiple users are bundled into such a single transaction, I am looking at one with 9 outputs, so let's assume those were 8 users, then 2.32$ divided by 8 means the transaction would have cost only 0.29$ per user. Meanwhile, Binance pocketed 8 times 0.0001 BTC, or 0.0008 BTC (52$).

 

TL;DR **Binance charged it's users 52$** on something that **costed only 2.32$**

 

The worst part of all this? They seem to hide this fee as most Nn customers won't even notice that "PaymentMissmatch" was caused by Binance. They all seem to think it's an Nn issue until I tell them and they double-check their Binance account history. Then they **fall victim again** as they are forced to **withdraw the missing balance** to complete the Nn purchase.

 

## How to avoid the hidden Binance exit tax?

 

Short answer, **do not use Binance**.

 

I suggest you **look into [CakeWallet](https://cakewallet.com/) or other self-custodial wallets**. I know Binance is very tempting to use, but you can withdraw all your assets onto these self-custodial wallets and use services like [FixedFloat](https://ff.io/) or [Thorswap](https://app.thorswap.finance/swap) to exchange one asset for another.

 



 

Date: 30/09/2024
 Author: Principal Vagina
