---
title: "让你的以太坊 DApps 盈利的 6 种方法"
date: 2018-03-25 21:22:22
categories:
- Blockchain
tags:
- Blockchain
- Dapp
---
简单说，广告商会支付给内容提供者和技术公司（你，其他开发者）钱，让他们把广告推到顾客（你的用户）面前。顾客依次被广告影响（不管他们是不是这么认为），然后在广告商的产品上花钱。在过去的 APP 市场，有 Lite，Regular 和 Pro 版本的 app。用户会试用提供给他们的产品，如果他们喜欢，则会购买完整版本的应用程序。使用该商业模式的公司，诸如 Spotify，Slack 或 Onedrive 等，通过购买付费订阅的用户来获得收入。在这个包含两部分的系列文章中，我们讨论并且实现了一些可以应用到你的 DApp 中的商业模型，当你的目标是用它盈利的时候。
<!-- more -->

这是「区块链技术指北」的第 30 篇文章。

> 如果对我感兴趣，想和我交流，我的微信号：**Wentasy**，加我时简单介绍下自己，并注明来自「区块链技术指北」。同时我会把你拉入微信群「区块链技术指北」。BTW，李笑来老师也加入了我们的知识星球，文末有加入方式。

在 [我（本文作者）过去的文章中](https://medium.com/loom-network/why-you-should-learn-to-build-blockchain-apps-be9a92e8d08e)，我们已经说明了你为什么应该学习创建区块链分布式应用。

![6 Ways to Monetize Your Ethereum DApps](https://i.imgur.com/D6S2I5V.png)

> 题图来自: © Georgios Konstantopoulos / 6 Ways to Monetize Your Ethereum DApps / medium.com

在这篇文章中，我们将讨论你怎么将他们货币化。

在讨论具体的 DApp 案例之前，让我们试着回答一个流行的问题：

> 传统 app 怎么赚钱？

简单说，广告商会支付给内容提供者和技术公司（你，其他开发者）钱，让他们把广告推到顾客（你的用户）面前。顾客依次被广告影响（不管他们是不是这么认为），然后在广告商的产品上花钱。

在过去的 APP 市场，有 Lite，Regular 和 Pro 版本的 app。用户会试用提供给他们的产品，如果他们喜欢，则会购买完整版本的应用程序。

![](https://i.imgur.com/SUZR9rP.png)

使用该商业模式的公司，诸如 Spotify，Slack 或 Onedrive 等，通过购买付费订阅的用户来获得收入。

免费增值模式的其他例子还包括，允许用真实货币购买游戏内物品的游戏类应用程序。

免费游戏 MMORPG 利用了所谓的 “免费限制” 方法。魔兽世界中的免费玩家，最高等级之允许为 20 级。其他游戏则对你可以探索的区域进行限制。这类游戏的最佳内容是为 “付费玩家” 游戏玩家保留的。

> 考虑到上述情况，当 DApp 开发人员寻求将自己的 DApp 货币化时，可以着眼于很多容易解决的问题。

正如 [前一篇文章](https://medium.com/loom-network/why-you-should-learn-to-build-blockchain-apps-be9a92e8d08e) 中所讨论的，你始终可以通过由令牌支持的众包来引导你的项目。

在这种情况下，你需要定义你的令牌 [ [1](https://medium.com/@mrdavey/good-discussion-and-question-2446e3827de2) ] 的需求：

* 你的 dapp 的核心功能 ( [Golem](https://golem.network/)，[Aragon](https://aragon.one/)，[Request](https://request.network/) )
* 提供你的网络的访问权 ( [BAT](https://basicattentiontoken.org/)，[Bloom](https://hellobloom.io/) )
* 将产品利润分配给代币持有者（TenX，Numerai）请注意，在这种情况下，你需要注意法规和 KYC 合规性，具体取决于你的代币是否被视为证券。

Cryptokitties 从每次成功拍卖中收取 3.75％ 的费用。这被证明是一个 [非常有利可图的收入模式](https://medium.com/@codetractio/a-look-into-cryptokitties-revenue-model-6466b705a998)。

![](https://i.imgur.com/Z4HZHLa.png)

上周 CK（Cryptokitties）的使用量致使交易费用陡升到 800 ETH。 来源: [DappRadar.com](https://dappradar.com/)

举个一般的例子:

1. **A** 通过你的服务从 **B** 买东西
2. 支付费用的 **Y%** 给服务提供商（你自己）  
3. (100- **Y** )% 支付给 **B**。

这里有一个警告。如果你向终端用户收取 “不公平” 的服务费用，那么终端用户将最后会复制你的智能合约并发布一个较低费用甚至免费的版本（考虑你的合同已经过验证且开放源代码的情况，而这也是人们对以太坊 DApps 通常期望的。

> 找出合适的价格来向用户收费是关键；不过这篇文章里我们不会介绍定价模型。

从前面讨论过的免费增值模式中激励自己 , 并拿我们在 [CryptoZombies](https://cryptozombies.io/) 中构建的游戏作示例，设想一下:

假设你的 CryptoZombie（加密僵尸军团）需要 10 次胜利才能升级，而且随着等级的提高越来越难。

从第 10 级到第 11 级的升级比从第 1 级升级到第 2 级要困难得多。 用户需要花费更多的精力来升级他们的 CryptoZombie（加密僵尸军团）。

![](https://i.imgur.com/z7Rewob.png)

收益递减规律

在这里你可以实现一个功能，它允许僵尸 “跳过” 这个努力并且直接升级，作为回报，用户需要支付一些数量的以太。

这样一来，免费玩家仍然能够获得最终游戏结果，但愿意额外付费的玩家可跳过这个努力的过程。

同样的情况也适用于重置僵尸的冷却时间。 僵尸通常需要在再次战斗之前等待`冷却时间`秒，但我们可以做到让用户支付一小笔费用来跳过冷却时间。

在这里你有很多不同的方式来用 DApps 获利，我们将在本文的第 2 部分讨论具体实现的代码。

你可以添加订阅或购买会员功能到你的合同中，这样某些功能只能被订阅者或高级会员调用。

订阅服务的持续方法可以是:

* **基于时间长度:** 用户被允许调用一个函数，直到 X 时间过去，例如，他们可以支付 1 个月的访问权限。
* **基于使用次数:** 用户被允许调用 X 次函数。你可以在 [维基百科](https://en.wikipedia.org/wiki/Subscription_business_model) 上阅读更多关于订阅的模型。

同样的，如何实现这些特定代码的示例将在本文章的第二部分中介绍。

考虑到我们正在谈论关于 DApp 本身的广告，这是一种不太流行的方法。[ThousandEtherHomepage](http://thousandetherhomepage.com/) 就是如此。你可以在合约中付费认领一些阵列，这些阵列会在 DApp 的前端以像素显示出来。就像你在下图看到的，这些像素已被一些项目（包括其他类型）用于其品牌宣传。

![](https://i.imgur.com/fYNqkJi.png)

如果上述任何内容听起来都太麻烦了，你可以随时在你的服务 / DApp 中加上你加密货币的地址，接受慷慨者的捐助。

你也可以将 [eth-button](https://eth-button.github.io/eth-button/) 添加到你的网页上以进行 Metamask 集成。

![](https://i.imgur.com/hS3Kocb.png)

[eth-button.github.io/eth-button](http://eth-button.github.io/eth-button)

第一部分是更强调理论。第 2 部分将包含实现上述货币化想法的代码。

在这两篇幅系列文章的 [第一部分](https://medium.com/loom-network/6-ways-to-monetize-your-ethereum-dapps-part-1-28e9bb18f87e?source=user_profile---------4-------------------)

我们已经有了让你的以太坊 Dapps 盈利的理论方法。在这部分，我们将会看一些代码示例，向你展示如何用 Solidity 来真正实现它们。

## 提取资金

首先，需要一个允许提取资金到所有者地址的函数。这就和下图一样简单：
![](https://i.imgur.com/yYJPN1W.png)

这个函数将会转移调用合约的余额到 `owner` （使用最流行的 `onlyOwner` 修饰符 ）的地址。如果你不熟悉上面的关键字是如何工作的，你也许想要暂停阅读，在完成我们在 [CryptoZombies.io](https://cryptozombies.io/) 的课程之后再继续。

**声明：** 接下来所有的例子都已经被简化，仅用来展示如何实现所讨论的功能。我们对业务逻辑做出假设，并且当我们创建一组智能合约的时候，我们没有做任何严格的安全措施。在部署你的代码前，一定要对它们做一个全面的安全审核。

### 1. 创建一个发售 / 发起一个 Token
***

这已经在 [以太坊官方网站](https://ethereum.org/crowdsale) 描述过。为了创建安全的发售，建议使用 Open Zeppelin 创建的 [audited contracts](https://github.com/OpenZeppelin/zeppelin-solidity/tree/master/contracts/crowdsale)。

你可以参考 [这份指南](https://blog.zeppelin.solutions/how-to-create-token-and-initial-coin-offering-contracts-using-truffle-openzeppelin-1b7a5dae99b6)，或者 [这个视频](https://www.youtube.com/watch?v=ShW2zQcY4LY) 来实现。

### 2. 高级功能 / 跳过努力
***

![](https://i.imgur.com/SZ98sMV.png)

在这里查看所有的代码: [https://ethfiddle.com/O3_2o-oqaZ](https://ethfiddle.com/O3_2o-oqaZ)

在这个例子中，我们可以看到一个用户可以通过花费 `1ether` 绕过 `winCount` 的升级要求。然后，应用所有者可调用之前讨论过的 `withdraw` 函数，来得到了他们的资金。

请注意，以太币的价格也许会在将来剧烈得升高（或降低），这将会改变使用你的高级特性的花费。所以在很多情况下，添加一个允许你在未来改变花费的 `onlyOwner`函数是合理的，否则你的应用将可能变得非常昂贵。这适用于接下来所有的例子。

### 3. 收取一定比例的交易市场手续费
***

在这个（非常简化）的例子中，当一个人想买一个僵尸的时候，价格的 10% 被发送到你的钱包，剩下的被转给到僵尸的拥有者。

![](https://i.imgur.com/eTX2syY.png)

查看整个合约在: [https://ethfiddle.com/MuApSyO3jx](https://ethfiddle.com/MuApSyO3jx)

为了节约一些费用，你可以跳过函数的第一行，这将会把以太币留在交易的余额里。通过使用我们之前描述的 `withdraw` 函数，你可以在后面的某个时间点提取合约上所有的以太币种。

### 4. 订阅 / 会员
***

这里，我们将会看到实现订阅 / 会员的商业逻辑的例子，主要有

1. 终生制
2. 基于时间制
3. 基于次数制

我们将会创建一个合约，在合约中，一些函数功能只能被标记为有权限的个人所调用。

#### 终生会员

这里是一个简单的例子，创建一个布尔类型的 `mapping`, 一个用来判断布尔值是否为真的 `modifier` 和一个允许用户花一些钱成为会员的函数。

![](https://i.imgur.com/yiaEXle.png)

在这里查看整个合约: [https://ethfiddle.com/LgzLNtIIVF](https://ethfiddle.com/LgzLNtIIVF)

或者，相对于使用一个布尔值代表会员 / 非会员，我们可以使用一个 `uint8` 类型，设计不同的会员等级，拥有更多的特性：免费用户是等级 0，等级 1 是银牌会员，等级 2 代表金牌会员等。
比如 `onlySilver()` 就能够检查会员等级是否 `>=1`。

这很简单，让我们继续。

#### 有时限的会员 / 订阅

在这里我们的商业模型将会假设订阅每天花费 0.005 以太币。

![](https://i.imgur.com/qtRpqHF.png)

在这里查看整个合约: [https://ethfiddle.com/Dx1jQlgazK](https://ethfiddle.com/Dx1jQlgazK)

在这个例子中，当一个用户调用 `renewSubscription` 函数的时候，如必要的话 `subscriptionExpiration` 会被初始化为 `now`，并且会根据用户的付费增加一些天数。
`onlyMember` 修饰语可以被用来检查当前的时间是否超过了会员有效期。

#### 基于使用的会员 / 付费使用

这里的商业模型涉及到一个用户预先购买函数调用，有点类似于你用设定好的价格购买 API 调用。

在这个例子中，用户每个以太币可以购买 1000 次调用。用户每次调用有`onlyIfEnoughCalls`修饰符的函数，在检查符合调用条件后，`availableCalls` 变量会减少。

![](https://i.imgur.com/G8F9V8K.png)

在这里查看整个合约: [https://ethfiddle.com/rO0xD9nIl6](https://ethfiddle.com/rO0xD9nIl6)

在上面所有的情景中，你可以添加对应的 `only{property}` 类型修饰符给任何函数，然后它将可以被有授权的用户调用。

## 结论

在这个包含两部分的系列文章中，我们讨论并且实现了一些可以应用到你的 DApp 中的商业模型，当你的目标是用它盈利的时候。

我想强调这篇文章给出的所有代码，是每个模型最基本的实现模块，并可以根据你的需求进行修改。

> via: https://medium.com/loom-network/6-ways-to-monetize-your-ethereum-dapps-part-1-28e9bb18f87e
> via: https://medium.com/loom-network/6-ways-to-monetize-your-ethereum-dapps-part-2-857a2820dec4
> 作者：[Georgios Konstantopoulos](https://medium.com/@gakonst)
> 译者：[Licyldj](https://github.com/Licyldj)，Part 1
> 译者: [maojr](https://github.com/maojr)，Part 2
> 校对：[RichardLian](https://github.com/RichardLian)

「区块链技术指北」同名 **知识星球**，二维码如下，欢迎加入。BTW，**李笑来老师也加入了**。

![区块链技术指北](https://i.imgur.com/pQxlDqF.jpg)

「区块链技术指北」相关资讯渠道：

* 「区块链技术指北」同名知识星球，[https://t.xiaomiquan.com/ZRbmaU3](https://t.xiaomiquan.com/ZRbmaU3)
* 官网，[https://chainone.xyz](https://chainone.xyz)
* 官方博客，[https://blog.chainone.xyz](https://blog.chainone.xyz)
* 官方社区，[https://bcage.one](https://bcage.one)
* Telegram Channel，[https://t.me/BlockchainAge](https://t.me/BlockchainAge)
* Telegram Group，[https://t.me/bcage](https://t.me/bcage)
* Twitter，[https://twitter.com/bcageone](https://twitter.com/bcageone)
* 新浪微博，[https://weibo.com/BlockchainAge](https://weibo.com/BlockchainAge)

同时，本系列文章会在以下渠道同步更新，欢迎关注：

* 「区块链技术指北」同名微信公众号（微信号：BlockchainAge）
* 官方博客，[https://blog.chainone.xyz](https://blog.chainone.xyz)
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