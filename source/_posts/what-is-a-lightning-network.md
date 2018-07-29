---
title: "什么是闪电网络？"
date: 2018-04-04 17:30:27
categories:
- Blockchain
tags:
- Blockchain
- Lightning Network
---
闪电网络是一种基于区块链的支付协议。这种协议可以用在即时支付的场景。从设计上来说，中本聪实现了快速完成交易所需要的多个构建模块。随着时间的推移，开发者们讨论了多次，他们希望能够把中本聪的这种想法变成现实。在 2015 年，两个年轻的开发者（Joseph Poon 和 Thaddeus Dryja）在中本聪原有设计的基础上，提交了一份基于闪电交易的分布式网络方案。
<!-- more -->

这是「区块链技术指北」的第 31 篇文章。

> 如果对我感兴趣，想和我交流，我的微信号：**Wentasy**，加我时简单介绍下自己，并注明来自「区块链技术指北」。同时我会把你拉入微信群「区块链技术指北」。BTW，李笑来老师也加入了我们的知识星球，文末有加入方式。

![Open Translating](https://i.imgur.com/3z7XcrB.png)

> 题图来自: © ChainONE / Open Translating / chainone.xyz

## 闪电网络
***

闪电网络是一种基于区块链的支付协议。这种协议可以用在即时支付的场景。从设计上来说，中本聪实现了快速完成交易所需要的多个构建模块。随着时间的推移，开发者们讨论了多次，他们希望能够把中本聪的这种想法变成现实。在 2015 年，两个年轻的开发者（Joseph Poon 和 Thaddeus Dryja）在中本聪原有设计的基础上，提交了一份基于闪电交易的分布式网络方案。

![](https://i.imgur.com/hHtr4lP.jpg)

[Image Source : https://pixabay.com](https://pixabay.com/fr/bitcoin-pi%C3%A8ce-de-monnaie-argent-2373267/)

闪电网络系统通过一些特性来改善其服务，主要包括：

- 即时支付：用户能够实现快速的区块链支付，不用再担心区块链确认时间过长。智能合约能够保证支付的安全性，它不再为每一次付款提交一次区块链交易，从而能够大幅度的提升交易时间，闪电网络的支付时间基本上是秒级或者毫秒级别的。
- 低成本：使用闪电网络的交易是在链下执行的，因此只需要很少的交易费用。这种特性使得即时的微支付成为可能。
- 扩展性：闪电网络可以支撑每秒钟上百万，甚至数十亿的交易。传统支付轨道也不受限制。此外，用户即使为每一个操作 / 点击附加上支付功能也是可以的。
- 跨链：这可以实现区块链之间的原子交换，并且通过适用于混合区块链共识的规则可以进行即时脱链。它使得在没有第三方托管情况下，不同的区块链之间进行交易成为可能（跨链交易的两个区块链必须确保在加密散列函数相同的情况下，双方可以进行交互）。

## 它是如何工作的？
***

闪电网络是使用区块链为基础的。它使用真正的区块链交易及其智能合约脚本语言，这使得它可以创建一个用户能够快速进行大量交量的环境。

这些是闪电网络涉及的一些特性：

- 双向支付通道：创建了支付通道的交易双方，在这个通道上的任何资金支出都需要双方共同的签名。这条通道在创建的时候会记录在区块链上，后续在此通道上的资金流转，不会被传播到区块链上。当这个通道要关闭的时候，系统会根据通道记录的资金分配方案，把资金打入双方的账号。
- 闪电网络：当网络上任何一个用户要与另外一个用户进行交易的时候，这两个用户之间很可能并没有支付通道，但通过网络中已经存在的支付通道，可以找到一条连接这两个用户的路径（这个过程很像互联网的路由过程）。在这条路径上的节点都是不可靠的，系统是通过逐步释放时间锁的算法来实现支付功能的。
- 区块仲裁者：链下的交易可以无限制的不断执行。基本上，这意味着链下交易伴随着链上的实现。通过可分析的脚本和交易，智能合约在区块链上得到执行，从而产生确定性结果。

## 优势
***

从理论上讲，闪电网络将影响到比特币的价值，安全性和被大众接受的普遍度， 但它不会收取高额费用，并且交易时间会大大缩短。另外，通过将所有小型的交易转移到闪电网络，比特币主网的负载将会减少，从而改善了主网上的交易费用和时间。

## 结论
***

闪电网络目前正准备在 Litecoin（莱特币），Bitcoin（比特币）和 Vertcoin (绿币）上使用，现在仍处于测试阶段。开发人员仍在努力推出应用程序和界面，从而使系统更加直观易用。

> via: https://steemit.com/cryptocurrency/@cryptoletter/what-is-a-lightning-network
> 作者：\[cryptoletter\]\(https://steemit.com/cryptocurrency/@cryptoletter)
> 译者：\[FreddyHao\]\(https://github.com/FreddyHao)
> 校对：\[dbarobin\]\(https://github.com/dbarobin)

「区块链技术指北」同名 **知识星球**，二维码如下，欢迎加入。BTW，**李笑来老师也加入了**。

![区块链技术指北](https://i.imgur.com/pQxlDqF.jpg)

「区块链技术指北」相关资讯渠道：

* 「区块链技术指北」同名知识星球，[https://t.xiaomiquan.com/ZRbmaU3](https://t.xiaomiquan.com/ZRbmaU3)
* 官网，[https://chainone.xyz](https://chainone.xyz)
* 官方博客，[https://blog.chainon.io](https://blog.chainon.io)
* 官方社区，[https://bcage.one](https://bcage.one)
* Telegram Channel，[https://t.me/BlockchainAge](https://t.me/BlockchainAge)
* Telegram Group，[https://t.me/bcage](https://t.me/bcage)
* Twitter，[https://twitter.com/bcageone](https://twitter.com/bcageone)
* 新浪微博，[https://weibo.com/BlockchainAge](https://weibo.com/BlockchainAge)

同时，本系列文章会在以下渠道同步更新，欢迎关注：

* 「区块链技术指北」同名微信公众号（微信号：BlockchainAge）
* 官方博客，[https://blog.chainon.io](https://blog.chainon.io)
* 知乎，[https://zhuanlan.zhihu.com/robinwen](https://zhuanlan.zhihu.com/robinwen)
* Steemit，[https://steemit.com/@robinwen](https://steemit.com/@robinwen)
* Medium，[https://medium.com/@robinwan](https://medium.com/@robinwan)
* 掘金，[robinwen@juejin.im](https://juejin.im/user/5673ccae60b2260ee435f89a/posts)
* 币乎，[https://bihu.com/people/12109](https://bihu.com/people/12109)

原创不易，读者可以通过如下途径打赏，虚拟货币、美元、法币均支持。

* BTC: 1HRZ7og2KjqpP3v3jskgueNu64kJrFU8GD
* ERC20 Token: 0x5c8DEB48dC08b5dC60A0290B718690a801509Dd1
* PayPal: [https://www.paypal.me/robinwen](https://www.paypal.me/robinwen)
* 微信打赏二维码

![Wechat](https://i.imgur.com/SzoNl5b.jpg)

–EOF–

版权声明：[自由转载-非商用-非衍生-保持署名（创意共享4.0许可证）](http://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh)
