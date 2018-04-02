---
title: "ERC20 Token 流通代码实现 "
date: 2018-04-02 14:20:00
categories:
- Blockchain
tags:
- Blockchain
- Ethereum
---

这是「区块链技术指北」的第 32 篇文章。

> 如果对我感兴趣，想和我交流，我的微信号：**Wentasy**，加我时简单介绍下自己，并注明来自「区块链技术指北」。同时我会把你拉入微信群「区块链技术指北」。BTW，李笑来老师也加入了我们的知识星球，文末有加入方式。

> 题图来自: © ChainONE / Open Writing / chainone.xyz

### 前言
***

在上一篇文章中我们掌握了如何发行自己的 ERC20 Token。如果只是单纯发一个 Token 是没有任何意义的，Token 应该是可以跟我们的产品运营结合，用于用户激励、产品推广等方面。就像交易所平台的平台币一样，既可以用来抵消交易费用，又可以用于投票等。这也是目前 token 真正有使用到的方式吧，就是当做平台的一种资产，这种资产是基于区块链的，无法串改的。而平台的运行还是中心化的运行方式，就像币乎一样。

那么在平台上的 Token 到底是怎么流通的呢？以币乎为例，币乎的 key 是基于以太坊的 ERC20 Token。我们知道在币乎上用户点赞会有奖励，评论点赞也有奖励，如果这种结算都放在了以太坊上来做的话，一个是速度可能会很慢，另一个结算的费用也会非常高。所以我们可以看到币乎里面有还未开放的充币，提币功能。这就是说，你只有提币的时候，币乎才会把你有的币转到你的以太坊钱包地址上。充币的话，币乎会给你一个以太坊地址，你把币转到这个地址上就行。这个做法应该是跟交易所的做法一样。那么前面提到的点赞奖励是怎么处理的呢？我的理解是，币乎在结算的时候会在你币乎账号 key 总数加上奖励给你的 key，只是简单的数据库修改下数据，并不会涉及 token 的转让流通。

那么站在程序角度来看，我们应该怎么用代码来实现 Token 的充 token、提 token 操作呢？

### 准备工作
***

以太坊提供了非常好用的工具来跟以太坊通信，web3.js 就是其中之一。下面我就介绍如果使用 web3.js 实现 token 的充 token，提 token。

下面的内容假设您已经了解以太坊、智能合约、solidity 以及 web3.js。不懂的话，建议先去了解下，网上已经有非常好的文章介绍了，我这里就不重复说明了。

首先你得在本地安装好 node.js（这个也不多做介绍）。

首先介绍下 [ganache](https://github.com/trufflesuite/ganache-cli)。 ganache 是一个基于内存的以太坊链，用于本地测试，而不用去连接测试网络，省去同步以太坊区块的麻烦。安装也很简单，命令行执行 `npm install -g ganache-cli`。

安装完成后，命令行执行 `ganache-cli`, 启动网络。

之前的文章，把 Token 发布到了 ropsten 测试网络上，这次我们选择本地环境，把 token 发布到我们本地网络上。首先在 metamask 中网络选择自定义网络，如下图：

![Imgur](https://i.imgur.com/JkFmrph.png)

确定后，在把我们的 MFC Token 重新发布一遍 (参见上一篇文章)。

好了，我们已经把 Token 发布到了本地网络了。接下来使用 web3.js 来调用本地测试网络。

为了方便测试，我是直接在页面上调用本地测试网络，真正的做法应该是调用服务器接口，服务器内有相应的服务调用以太坊网络。这里只是为了方便展示才这样做的，大家不要以这样的方式上线。

我们可以总结出几个必须有的功能： 1 查询余额， 2 Token 提现，3 充 Token，4 账户之间转以太。

### 代码实现
***

#### 查余额
***

首先实现如何查询账户余额的功能，包括以太坊余额和 MFC 余额。看如下代码。

``` js
// 首先在页面引入我们需要使用的 js
<script src="./web3.min.js"></script>
<script src="./ethereumjs-wallet-0.6.0.min.js"></script>

<script>
// 初始化 web3 对象
f (typeof web3 !== 'undefined') {
  web3 = new Web3(web3.currentProvider);
} else {
  // set the provider you want from Web3.providers
  web3 = new Web3(new  Web3.providers.HttpProvider("http://localhost:8545"));
}
// 使用本地测试网络的第一个账户为默认账户
eb3.eth.defaultAccount = web3.eth.accounts[0];

// 从 remix compile tab 页中 MyFreeCoin 的 detail 中复制 abi 信息到 contract() 方法内，不懂 remix 的请看前面那边文章
ar mfcContract = web3.eth.contract([{...}]);

//  从 remix run tab 页发布的合约上复制合约地址
ar contractAddress = '0x09901f8fdf2265d9be48c7877161a2f6c2e503e8';
// 初始化我们的合约对象
ar contract = mfcContract.at(contractAddress);

// 获取我们需要查询的以太坊地址
ar address = document.getElementById('address').value;
if(!web3.isAddress(address)){ // 检测地址是合法的以太坊地址
   alert("Invalid address!");
	return ;
}
// 查询以太坊地址的 eth 余额
eb3.eth.getBalance(address, function(err, resp){
	if(!err){
		eth.innerHTML = web3.fromWei(resp, 'ether').toNumber();
	}else{
		console.log(err);
	}

});
// 查询 MFC 的余额
ontract.balanceOf(address, (err, tkns) => {
    if (!err) {
      mfc.innerHTML = web3.fromWei(tkns, 'ether').toNumber()
    }else{
    	console.log(err)
    }

  })
</script>
```

#### 提 Token
***

提 Token 的操作是，我们提供自己的以太坊地址给平台，平台给这个地址打 Token。 实现代码如下：

``` js
// 获取提 token 的以太坊地址
ar reciver = document.getElementById('reciver').value;
// 提 token 数量
ar amount = document.getElementById('amount').value;
if(!web3.isAddress(reciver)){ // 检测地址是否合法
   alert("reciver: Invalid address!");
	return ;
}
// 发送 token，注意这里默认是从本地测试网络的第一个账户转 token 过去，因为我们的默认账户就是它 web3.eth.defaultAccount = web3.eth.accounts[0]; 同时在 remix 发布合约的时候，我们是使用第一个账户发布的，也就是说第一个账户开始拥有所有的 MFC Token
contract.transfer(reciver, web3.toWei(amount), function(err, resp){
	if(!err){
		console.log(resp);
		alert('success');
	}else{
		console.log(err);
	}
})
```

这就实现了从发布合约的默认账户转 token 到用户地址的功能。但是这么做是比较危险的，因为您把所有的 token 都放到了一个联网的账户中，如果平台被黑客入侵，就有可能把您所有的 Token 转走，风险会比较大。所以正常的做法应该是，把包含大量 token 的账户保存在冷钱包里面，只在需要使用的时候才从冷钱包里面提 Token 到运营的账户地址中。那就是说我们需要实现两个地址之间转 token 的功能，不能像上面那样默认使用发 Token 的账户来转 Token 了。那么我们应该怎么来实现呢？看下面的代码

``` js
// 假设这个是我们的运营钱包地址
ar from = '0x009ddafb6dd10f2ed72dd0d0c7f291b5a0cea9eb';
// 转 token 的数量
ar amount = document.getElementById('mAmount').value;
// 提 token 的地址
ar to = document.getElementById('mTo').value;

if(!web3.isAddress(to)){
	alert("Invalid to address");
	return ;
}

// 获取当前交易数，当 nonce 使用
eb3.eth.getTransactionCount(from, function(err, count){
	if(!err){
		var tcount = count;
		// 先检查当前运营账户的余额够不够转 token
		contract.balanceOf(from, (err, tkns) => {
	        if (!err) {
	           var balance = web3.fromWei(tkns, 'ether').toNumber();
	           if(balance < amount){
	           		alert('You do not get enough mfc token!');
	           		return ;
	           }
	           amount = web3.toWei(amount);
	           // 交易信息
              var rawTransaction = {
			      "from": from,
			      "nonce": "0x" + tcount.toString(16),
			      "gasPrice": "0x003B9ACA00",
			      "gasLimit": "0x250CA",
			      "to": contractAddress,
			      "value": "0x0",
			      "data": contract.transfer(to, amount).encodeABI()
			  };

			  // 运营钱包地址的私钥，需要用它来签名交易
   		  var privKey = new Buffer("0x811502c101ae015b658dccbdb6626840b734c40ba229ce78877826c27ca07513", 'hex');
			  // 对交易签名
   		  var tx = new ethereumjs.Tx(rawTransaction);
			  tx.sign(privKey);
			  var serializedTx = tx.serialize();

			  // 发送交易到以太坊
   		  web3.eth.sendSignedTransaction('0x' + serializedTx.toString('hex'),function(err, result){
			  	if(!err){
			  		console.log(result);
			  	}else{
			  		console.log(err);
			  	}
			  });
	        }else{
	        	console.log(err)
	        }

      	})
	}else{
		console.log(error);
	}
```

这样就可以实现不同账户之间的转 Token 操作了。

#### 充 Token
***

充 Token。首先我们要理解下充 Token，是用户从他钱包地址转 Token 到我们平台的账户地址。所以首先我们得给用户提供一个跟他对应的钱包地址，同时要监控用户的转 Token 事件，当用户转 Token 过来了，我们需要记录，同时在数据库中把用户的 Token 余额增加。所以我们得先搞定给用户提供一个钱包地址，这里我们使用到了 `Ethereum-Wallet` 来帮我们生成地址，公钥，私钥。代码如下：

``` js
// 上面已经引入了 Ethereum-Wallet 相应的 js

// 用户生成地址的密码
ar password = document.getElementById('password').value;
// 初始化钱包对象
ar wallet = ethereumjs.Wallet.generate(password);

// 获取私钥
ocument.getElementById('gPrikey').innerHTML = "private key:" + wallet.getPrivateKeyString();
// 获取公钥
ocument.getElementById('gPubkey').innerHTML = "public key:" + wallet.getPublicKeyString();
// 获取地址
ocument.getElementById('gAddress').innerHTML = "address:" + wallet.getAddressString();
```

但是还有一个问题，当用户转 token 过来，我们怎么知道他有转呢？在我们的 Token 只能合约里面每次转 Token 的都会触发 Transfer 事件（solidity 知识），我们只需要监听这个事件就可以了，代码如下：

``` js
// 监听 转 token 事件
ontract.Transfer(function(err, res) {
	if(!err){
		console.log(res);
		// 发送 Token 的地址
   	var from =  res.args._from;
		// 接受 Token 的地址 所以我们只需要对比下 接受 Token 的地址，是我们自己的地址，那就可以给相应的用户增加充 token 记录了。
		var to = res.args._to;
		var amount = web3.fromWei(res.args._value).toNumber();
		var html = '<p>From:'+ from+';To:'+ to+';Amount:'+amount+'</p>';
		document.getElementById('logs').insertAdjacentHTML('beforeend', html);
	}else{
		console.log(err);
	}
})
```

### 转 ETH
***

账户之间发送 eth。有一些新生成的账户开始是没有 eth 的，我们需要给它转的 eth，以供它使用，代码如下：

``` js
// 接受 eth 地址
ar etherAdress = document.getElementById('etherAdress').value;
if(!web3.isAddress(etherAdress)){
	alert('Invalid address');
	return ;
}
// 发送交易， 转 eth，这里使用的默认账户转 eth，如果想使用另外的地址转也跟 转 token 一样，使用私钥来签名交易即可
eb3.eth.sendTransaction({
    to: etherAdress,
    value: '1000000000000000000'
},function(err, result){
	if(!err){
		console.log(result);
	}else{
		console.log(err);
	}
})
```

这样 Token 之间的流通代码实现已经完成了，具体的代码实现可以在 [GitHub](https://github.com/Rhain/testeth) 上查看。

上面提到的肯定还有不足的地方，可能我理解也是错误的，也请大家指出错误的地方。大家共同进步。

Token 已经知道了如何流通了，但是艾西欧又是怎么一回事呢？为何给一个地址转 eth 就可以得到 Token 呢？如何发布一个艾西欧合约呢？这也是后面我会继续研究的，自己发行一个艾西欧来玩玩，当然是在测试环境！

----
 更新

有同学指出账户间的转账有问题，经过我的测试发现确实是存在一个问题，就是账户之间转账的时候，默认转的还是 web3.eth.defaultAccout 账户的 token，而没有转经过私钥签名的账户。

后面查看 web3.js 的文档，文档的 web3.js 对应的版本是 1.0，但是我们使用的还是 0.x 版本。 而且 1.0 版本的 api 跟之前的版本变化非常大。

我重新使用 web3.js 1.x 的版本重新实现了一遍。 测试用户间的转账是没有问题的。修改后的代码已经上传到 [GitHub](https://github.com/Rhain/testeth), 参考文件 `mfc2.html`。

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