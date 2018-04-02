---
title: "以太坊发 token 教程"
date: 2018-04-02 08:20:00
categories:
- Blockchain
tags:
- Blockchain
- Ethereum
---

这是「区块链技术指北」的第 31 篇文章。

> 如果对我感兴趣，想和我交流，我的微信号：**Wentasy**，加我时简单介绍下自己，并注明来自「区块链技术指北」。同时我会把你拉入微信群「区块链技术指北」。BTW，李笑来老师也加入了我们的知识星球，文末有加入方式。

2017 年出现了非常多的数字货币。但是这种货币是如何产生的，作为一个程序员。怀着对发币的好奇，自己动手把发币的流程给走了一遍。再此记录下。这里发币特指 ERC20 token。

![ChainONE Open Writing](https://i.imgur.com/smxzEPJ.png)

> 题图来自: © ChainONE / Open Writing / chainone.xyz

### 准备工作
***

在发 Token 前，你先的确定一下几点：

1. Token 的名称
2. Token 的标识
3. Token 的小数位
4. Token 发型量

我的选择是：

1. 名称：MyFreeCoin
2. 标识：MFC
3. 小数位： 18
4. 发行量： 10000

小数位是 18 位，表示 MFC 这个 Token 最小可以到 .0000000000000000001。

### Token 代码
***

编写 MFC 的智能合约：

Token 的合约代码我们参考 [Token-Factory](https://github.com/ConsenSys/Token-Factory/tree/master/contracts) 的代码。

``` javascript
pragma solidity ^0.4.4;

contract Token {

    /// @return 返回 token 的发行量
    function totalSupply() constant returns (uint256 supply) {}

    /// @param _owner 查询以太坊地址 token 余额
    /// @return The balance 返回余额
    function balanceOf(address _owner) constant returns (uint256 balance) {}

    /// @notice msg.sender（交易发送者）发送 _value（一定数量）的 token 到 _to（接受者）
    /// @param _to 接收者的地址
    /// @param _value 发送 token 的数量
    /// @return 是否成功
    function transfer(address _to, uint256 _value) returns (bool success) {}

    /// @notice 发送者 发送 _value（一定数量）的 token 到 _to（接受者）
    /// @param _from 发送者的地址
    /// @param _to 接收者的地址
    /// @param _value 发送的数量
    /// @return 是否成功
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}

    /// @notice 发行方 批准 一个地址发送一定数量的 token
    /// @param _spender 需要发送 token 的地址
    /// @param _value 发送 token 的数量
    /// @return 是否成功
    function approve(address _spender, uint256 _value) returns (bool success) {}

   /// @param _owner 拥有 token 的地址
    /// @param _spender 可以发送 token 的地址
    /// @return 还允许发送的 token 的数量
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}

   /// 发送 Token 事件
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
   /// 批准事件
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
```

``` javascript
/*
This implements ONLY the standard functions and NOTHING else.
For a token like you would want to deploy in something like Mist, see HumanStandardToken.sol.

If you deploy this, you won't have anything useful.

Implements ERC 20 Token standard: https://github.com/ethereum/EIPs/issues/20
.*/

// 实现 ERC20 标准

pragma solidity ^0.4.4;

import "./Token.sol";

contract StandardToken is Token {

    // 发送交易方，转 token 给哪个地址
    function transfer(address _to, uint256 _value) returns (bool success) {
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else {return false;}
    }

    // 从一个地址转 token 到另一个地址
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } else {return false;}
    }

    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    uint256 public totalSupply;
}
```

``` javascript
/*
This Token Contract implements the standard token functionality (https://github.com/ethereum/EIPs/issues/20) as well as the following OPTIONAL extras intended for use by humans.

In other words. This is intended for deployment in something like a Token Factory or Mist wallet, and then used by humans.
Imagine coins, currencies, shares, voting weight, etc.
Machine-based, rapid creation of many tokens would not necessarily need these extra features or will be minted in other manners.

1) Initial Finite Supply (upon creation one specifies how much is minted).
2) In the absence of a token registry: Optional Decimal, Symbol & Name.
3) Optional approveAndCall() functionality to notify a contract if an approval() has occurred.

.*/
pragma solidity ^0.4.4;

import "./StandardToken.sol";

contract MyFreeCoin is StandardToken {

    function () {
        //if ether is sent to this address, send it back.
        throw;
    }

    /* Public variables of the token */

    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
    string public name;                   //token 名称: MyFreeCoin
    uint8 public decimals;                // 小数位
    string public symbol;                 // 标识
    string public version = 'H0.1';       // 版本号

    function MyFreeCoin(
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
        ) {
        balances[msg.sender] = _initialAmount;               // 合约发布者的余额是发行数量
        totalSupply = _initialAmount;                        // 发行量
        name = _tokenName;                                   // token 名称
        decimals = _decimalUnits;                            // token 小数位
        symbol = _tokenSymbol;                               // token 标识
    }

    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}
```

如果想要发行自己的 token，只需要把 `MyFreeCoin` 出现的地方替换为你的 token 名称。

需要注意的一点是，你发行的数量需要相对 token 小数点来设置。例如如果 token 的小数点是 0，而你要发行 1000 个 token，那么发行数量的值 1000。但是如果 token 的小数点是 18 位，你要发行 1000 个 token，那么发行数量的值是 1000000000000000000000（1000 后面加上 18 个 0）。

`balances[msg.sender] = _initialAmount;  ` 这行代码，我们把合约的发布者的余额设置为发行量的数量。

### 发布 Token
***

在测试网络上发行我们的 token：

1. 安装 [MetaMask](https://metamask.io/) 钱包。

2. 安装 MetaMask 之后，登陆 Metamask， 左上角选择 Ropsten。如下图：

![Imgur](https://i.imgur.com/1HM1qLj.png)

这个账号将会是我们的智能合约的所有者，也就是说 token 发行数量都是存入到这个账号。

3. 打开 [Solidity Remix Compiler ](https://remix.ethereum.org/),remix 是一个在线编译器可以帮我们把智能合约直接发布到以太坊上。

4. 把上面三个文件代码复制到 remix 编辑器中。可以先删除 remix 中默认 ballot.sol 文件，在新建 Token.sol , StandardToken.sol, MyFreeCoin.sol 三个文件， 相应的把代码复制到文件中，如下图：

![Imgur](https://i.imgur.com/G4TQbhr.png)

5.  点击 `start to compile` 编译代码文件。

6. 给我们的测试账号申请点 eth 来测试，如下图点击 buy 按钮，再点击 `ropsten test faucet`。

![Imgur](https://i.imgur.com/LYVs0cH.png)

![Imgur](https://i.imgur.com/Lf5HqBH.png)

7. 会打开 [faucet metamask](https://faucet.metamask.io/) 网站，点击
`request 1 eth from faucet`。成功后会生成 交易记录。

![Imgur](https://i.imgur.com/KOAx5rv.png)

![Imgur](https://i.imgur.com/XwQLpc8.png)

8. 可以查看到我们的测试账户上已经有了 eth 可以用了。

![Imgur](https://i.imgur.com/DyQLBuK.png)

9. 选中 remix 中的 run 菜单，下拉框中选择 MyFreeCoin, 在 create 按钮的左边输入框中输入 `"10000000000000000000000","MyFreeCoin",18,"MFC"`, 如下图

![Imgur](https://i.imgur.com/tsvbyWz.png)

截图的时候 10000000000000000000000 没有用双引号引起来是错误的，需要注意用双引号引起来。

10.  点击 create 按钮，需要注意的是发行量需要包含在 "" 中。 metamask 会弹出确认框。如下图：

![Imgur](https://i.imgur.com/cdUbsnq.png)

11. 确定后，会进入挂起状态，等待矿工打包交易。

12. 等一段时间后，交易完成，会显示 MyFreeCoin 合约。

![Imgur](https://i.imgur.com/s4Ko0ii.png)

13. 点击 MyFreeCoin 的复制按钮，复制合约地址在 [ropsten etherscan](https://ropsten.etherscan.io) 中查询，可以查询到我们的合约情况，如下图：

![Imgur](https://i.imgur.com/AcotJXf.png)

14. 验证我们发布的 token。在 metamask 的 token 中点击 add token 按钮。如下图：

![Imgur](https://i.imgur.com/j3eVjRq.png)

15. 在 add token 的地址填入我们刚才复制的合约地址，如下图：

![Imgur](https://i.imgur.com/M3akjPS.png)

16. 可以在 token 中看到我们新创建的 token。如下图：

![Imgur](https://i.imgur.com/fayqUVM.png)

17. 认证我们的合约代码。 在刚才 ropsten ethscan 的合约地址页面中，点击 Contract code， 如下图：

![Imgur](https://i.imgur.com/evRh8j7.png)

18. 点击 Verify and Publish， 会进入如下页面：

![Imgur](https://i.imgur.com/Hd2r0Xv.png)

19. 在 `Contract name:` 的输入框输入 token 名称 MyFreeCoin, Compiler 选择在 remix 的 sttings 中 Solidity version 显示的版本号。Optimization 选择 No。 然后在 Enter the Solidity Contract Code below 下面的输入框中填入代码，我们的代码有三个文件，需要把它们合并成一个文件，合并的格式是这样：

``` javascript
pragma solidity ^0.4.4;
contract Token {
}
contract StandardToken is Token {
}
contract MyFreeCoin is StandardToken {
}
```

去掉原来代码文件中的 import 语句。最后提交。成功后，会显示下面的页面表示验证成功：

![Imgur](https://i.imgur.com/1oJ8sKH.png)

### 转让 Token
***

最后让我们在不同地址之间流通这个 token。我们第一个账户已经有 1000 的 MFC 了。

先让我们在创建一个新的账户，如下图：

![Imgur](https://i.imgur.com/l8e1DHW.png)

可以看到我们新创建的账户 MFC 的值是 0.

![Imgur](https://i.imgur.com/xNzm4SA.png)

在切回我们的第一个账户，在 transfer 中填入第二账户的地址和转入的数量 ("0xe4da4CBC744708A6656BeD252f49DF5exxxxxxC97","1000000000000000000")。如下图：

![Imgur](https://i.imgur.com/4roFpBF.png)

点击 transfer 会弹出弹框让你确定，点击 sumbit，等待区块打包。切换到第二个账户，查看 MFC 余额。可以看到已经到转过来的 1MFC 了。

![Imgur](https://i.imgur.com/N2j8XOa.png)

最终我们的发 token 的流程已经结束了。但是这还只是第一步，后面我们还需要程序化的执行 token 的充币，提币操作。也是一个应用若想引入 token 进来必须要有的功能。后面会继续研究下去，实现用程序来操作 Token 的转让。

参考文章：

> [how-to-create-your-own-ethereum-token-in-an-hour-erc20-verified](https://steemit.com/ethereum/@maxnachamkin/how-to-create-your-own-ethereum-token-in-an-hour-erc20-verified)

「区块链技术指北」同名 ** 知识星球 **，二维码如下，欢迎加入。BTW，** 李笑来老师也加入了 **。

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

![Imgur](https://i.imgur.com/JCMV4vL.jpg)

–EOF–

 版权声明：[自由转载 - 非商用 - 非衍生 - 保持署名（创意共享 4.0 许可证）](http://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh)
