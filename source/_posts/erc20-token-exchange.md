---
title: "ERC20 Token��ͨ����ʵ��"
date: 2018-03-24 14:20:00
categories:
- Blockchain
tags:
- Blockchain
- ERC20 Token
---

### ǰ��
����һƪ������������������η����Լ���ERC20 Token�����ֻ�ǵ�����һ��Token��û���κ�����ģ�TokenӦ���ǿ��Ը����ǵĲ�Ʒ��Ӫ��ϣ������û���������Ʒ�ƹ�ȷ��档��������ƽ̨��ƽ̨��һ�����ȿ��������������׷��ã��ֿ�������ͶƱ�ȡ���Ҳ��Ŀǰtoken������ʹ�õ��ķ�ʽ�ɣ����ǵ���ƽ̨��һ���ʲ��������ʲ��ǻ����������ģ��޷����ĵġ���ƽ̨�����л������Ļ������з�ʽ������Һ�һ����

��ô��ƽ̨�ϵ�Token��������ô��ͨ���أ��ԱҺ�Ϊ�����Һ���key�ǻ�����̫����ERC20 Token������֪���ڱҺ����û����޻��н��������۵���Ҳ�н�����������ֽ��㶼��������̫���������Ļ���һ�����ٶȿ��ܻ��������һ������ķ���Ҳ��ǳ��ߡ��������ǿ��Կ����Һ������л�δ���ŵĳ�ң���ҹ��ܡ������˵����ֻ����ҵ�ʱ�򣬱Һ��Ż�����еı�ת�������̫��Ǯ����ַ�ϡ���ҵĻ����Һ������һ����̫����ַ����ѱ�ת�������ַ�Ͼ��С��������Ӧ���Ǹ�������������һ������ôǰ���ᵽ�ĵ��޽�������ô������أ��ҵ�����ǣ��Һ��ڽ����ʱ�������Һ��˺�key�������Ͻ��������key��ֻ�Ǽ򵥵����ݿ��޸������ݣ��������漰token��ת����ͨ��

��ôվ�ڳ���Ƕ�����������Ӧ����ô�ô�����ʵ��Token�ĳ�token����token�����أ�

### ׼������
��̫���ṩ�˷ǳ����õĹ���������̫��ͨ�ţ�web3.js ��������֮һ�������Ҿͽ������ʹ�� web3.jsʵ��token�ĳ�token����token��

��������ݼ������Ѿ��˽���̫�������ܺ�Լ��solidity�Լ�web3.js�������Ļ���������ȥ�˽��£������Ѿ��зǳ��õ����½����ˣ�������Ͳ��ظ�˵���ˡ�

��������ڱ��ذ�װ�� node.js�����Ҳ���������ܣ���

���Ƚ�����[ganache](https://github.com/trufflesuite/ganache-cli)�� ganache��һ�������ڴ����̫���������ڱ��ز��ԣ�������ȥ���Ӳ������磬ʡȥͬ����̫��������鷳����װҲ�ܼ򵥣�������ִ�� `npm install -g ganache-cli`��

��װ��ɺ�������ִ��`ganache-cli`,�������硣

֮ǰ�����£���Token��������ropsten���������ϣ��������ѡ�񱾵ػ�������token���������Ǳ��������ϡ�������metamask������ѡ���Զ������磬����ͼ��
![Imgur](https://i.imgur.com/JkFmrph.png)

ȷ�����ڰ����ǵ�MFC Token���·���һ��(�μ���һƪ����)��

���ˣ������Ѿ���Token�������˱��������ˡ�������ʹ��web3.js�����ñ��ز������硣

Ϊ�˷�����ԣ�����ֱ����ҳ���ϵ��ñ��ز������磬����������Ӧ���ǵ��÷������ӿڣ�������������Ӧ�ķ��������̫�����硣����ֻ��Ϊ�˷���չʾ���������ģ���Ҳ�Ҫ�������ķ�ʽ���ߡ�

���ǿ����ܽ�����������еĹ��ܣ� 1 ��ѯ�� 2 Token���֣�3 ��Token��4 �˻�֮��ת��̫�� 

### ����ʵ��

#### �����
����ʵ����β�ѯ�˻����Ĺ��ܣ�������̫������MFC�������´��롣

```
// ������ҳ������������Ҫʹ�õ�js
<script src="./web3.min.js"></script>
<script src="./ethereumjs-wallet-0.6.0.min.js"></script>

<script>
// ��ʼ��web3 ����
if (typeof web3 !== 'undefined') {
  web3 = new Web3(web3.currentProvider);
} else {
  // set the provider you want from Web3.providers
  web3 = new Web3(new  Web3.providers.HttpProvider("http://localhost:8545"));
}
// ʹ�ñ��ز�������ĵ�һ���˻�ΪĬ���˻�
web3.eth.defaultAccount = web3.eth.accounts[0];

// ��remix compile tabҳ��MyFreeCoin�� detail�и��� abi��Ϣ�� contract() �����ڣ�����remix���뿴ǰ���Ǳ�����
var mfcContract = web3.eth.contract([{...}]);

//  ��remix run tabҳ�����ĺ�Լ�ϸ��ƺ�Լ��ַ
var contractAddress = '0x09901f8fdf2265d9be48c7877161a2f6c2e503e8';
// ��ʼ�����ǵĺ�Լ����
var contract = mfcContract.at(contractAddress);

// ��ȡ������Ҫ��ѯ����̫����ַ
var address = document.getElementById('address').value;
if(!web3.isAddress(address)){ // ����ַ�ǺϷ�����̫����ַ
	alert("Invalid address!");
	return ;
}
// ��ѯ��̫����ַ�� eth���
web3.eth.getBalance(address, function(err, resp){
	if(!err){
		eth.innerHTML = web3.fromWei(resp, 'ether').toNumber();
	}else{
		console.log(err);
	}

});
// ��ѯMFC�����
contract.balanceOf(address, (err, tkns) => {
    if (!err) {
      mfc.innerHTML = web3.fromWei(tkns, 'ether').toNumber()
    }else{
    	console.log(err)
    }
    
  })
</script>
```

#### ��Token
��Token�Ĳ����ǣ������ṩ�Լ�����̫����ַ��ƽ̨��ƽ̨�������ַ�� Token�� ʵ�ִ������£�

```
// ��ȡ��token����̫����ַ
var reciver = document.getElementById('reciver').value;
// ��token����
var amount = document.getElementById('amount').value;
if(!web3.isAddress(reciver)){ // ����ַ�Ƿ�Ϸ�
	alert("reciver: Invalid address!");
	return ;
}
// ����token��ע������Ĭ���Ǵӱ��ز�������ĵ�һ���˻�תtoken��ȥ����Ϊ���ǵ�Ĭ���˻������� web3.eth.defaultAccount = web3.eth.accounts[0]; ͬʱ��remix������Լ��ʱ��������ʹ�õ�һ���˻������ģ�Ҳ����˵��һ���˻���ʼӵ�����е�MFC Token
contract.transfer(reciver, web3.toWei(amount), function(err, resp){
	if(!err){
		console.log(resp);
		alert('success');
	}else{
		console.log(err);
	}
})
```
���ʵ���˴ӷ�����Լ��Ĭ���˻�תtoken���û���ַ�Ĺ��ܡ�������ô���ǱȽ�Σ�յģ���Ϊ�������е�token���ŵ���һ���������˻��У����ƽ̨���ڿ����֣����п��ܰ������е�Tokenת�ߣ����ջ�Ƚϴ�
����������������Ӧ���ǣ��Ѱ�������token���˻���������Ǯ�����棬ֻ����Ҫʹ�õ�ʱ��Ŵ���Ǯ��������Token����Ӫ���˻���ַ�С��Ǿ���˵������Ҫʵ��������ַ֮��תtoken�Ĺ��ܣ���������������Ĭ��ʹ�÷�Token���˻���תToken�ˡ���ô����Ӧ����ô��ʵ���أ�������Ĵ���

```

// ������������ǵ���ӪǮ����ַ
var from = '0x009ddafb6dd10f2ed72dd0d0c7f291b5a0cea9eb';
// תtoken������
var amount = document.getElementById('mAmount').value;
// ��token�ĵ�ַ
var to = document.getElementById('mTo').value;

if(!web3.isAddress(to)){
	alert("Invalid to address");
	return ;
}

// ��ȡ��ǰ����������nonceʹ��
web3.eth.getTransactionCount(from, function(err, count){
	if(!err){
		var tcount = count;
		// �ȼ�鵱ǰ��Ӫ�˻���������תtoken
		contract.balanceOf(from, (err, tkns) => {
	        if (!err) {
	           var balance = web3.fromWei(tkns, 'ether').toNumber();
	           if(balance < amount){
	           		alert('You do not get enough mfc token!');
	           		return ;
	           }
	           amount = web3.toWei(amount);
	           // ������Ϣ
	           var rawTransaction = {
			      "from": from,
			      "nonce": "0x" + tcount.toString(16),
			      "gasPrice": "0x003B9ACA00",
			      "gasLimit": "0x250CA",
			      "to": contractAddress,
			      "value": "0x0",
			      "data": contract.transfer(to, amount).encodeABI()
			  };
			  
			  // ��ӪǮ����ַ��˽Կ����Ҫ������ǩ������
			  var privKey = new Buffer("0x811502c101ae015b658dccbdb6626840b734c40ba229ce78877826c27ca07513", 'hex');
			  // �Խ���ǩ��
			  var tx = new ethereumjs.Tx(rawTransaction);
			  tx.sign(privKey);
			  var serializedTx = tx.serialize();
			  
			  // ���ͽ��׵���̫��
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

�����Ϳ���ʵ�ֲ�ͬ�˻�֮���תToken�����ˡ�

#### ��Token
��Token����������Ҫ����³�Token�����û�����Ǯ����ַתToken������ƽ̨���˻���ַ�������������ǵø��û��ṩһ��������Ӧ��Ǯ����ַ��ͬʱҪ����û���תToken�¼������û�תToken�����ˣ�������Ҫ��¼��ͬʱ�����ݿ��а��û���Token������ӡ��������ǵ��ȸ㶨���û��ṩһ��Ǯ����ַ����������ʹ�õ���`Ethereum-Wallet`�����������ɵ�ַ����Կ��˽Կ���������£�

```
// �����Ѿ�������Ethereum-Wallet��Ӧ��js

// �û����ɵ�ַ������
var password = document.getElementById('password').value;
// ��ʼ��Ǯ������
var wallet = ethereumjs.Wallet.generate(password);

// ��ȡ˽Կ
document.getElementById('gPrikey').innerHTML = "private key:" + wallet.getPrivateKeyString();
//��ȡ��Կ
document.getElementById('gPubkey').innerHTML = "public key:" + wallet.getPublicKeyString();
// ��ȡ��ַ
document.getElementById('gAddress').innerHTML = "address:" + wallet.getAddressString();
```
���ǻ���һ�����⣬���û�תtoken������������ô֪������ת�أ������ǵ�Tokenֻ�ܺ�Լ����ÿ��תToken�Ķ��ᴥ��Transfer�¼���solidity֪ʶ��������ֻ��Ҫ��������¼��Ϳ����ˣ��������£�

```
// ���� תtoken�¼�
contract.Transfer( function(err, res) {
	if(!err){
		console.log(res);
		// ����Token�ĵ�ַ
		var from =  res.args._from;
		// ����Token�ĵ�ַ ��������ֻ��Ҫ�Ա��� ����Token�ĵ�ַ���������Լ��ĵ�ַ���ǾͿ��Ը���Ӧ���û����ӳ�token��¼�ˡ�
		var to = res.args._to;
		var amount = web3.fromWei(res.args._value).toNumber();
		var html = '<p>From: '+ from+';To: '+ to+';Amount: '+amount+'</p>';
		document.getElementById('logs').insertAdjacentHTML('beforeend', html);
	}else{
		console.log(err);
	}
})
```

### תETH
�˻�֮�䷢��eth����һЩ�����ɵ��˻���ʼ��û��eth�ģ�������Ҫ����ת��eth���Թ���ʹ�ã��������£�

```
// ����eth��ַ
var etherAdress = document.getElementById('etherAdress').value;
if(!web3.isAddress(etherAdress)){
	alert('Invalid address');
	return ;
}
// ���ͽ��ף� תeth������ʹ�õ�Ĭ���˻�תeth�������ʹ������ĵ�ַתҲ�� תtokenһ����ʹ��˽Կ��ǩ�����׼���
web3.eth.sendTransaction({
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

����Token֮�����ͨ����ʵ���Ѿ�����ˣ�����Ĵ���ʵ�ֿ�����[GitHub](https://github.com/Rhain/testeth)�ϲ鿴��

�����ᵽ�Ŀ϶����в���ĵط������������Ҳ�Ǵ���ģ�Ҳ����ָ������ĵط�����ҹ�ͬ������

Token�Ѿ�֪���������ͨ�ˣ����ǰ���ŷ������ôһ�����أ�Ϊ�θ�һ����ַתeth�Ϳ��Եõ�Token�أ���η���һ������ŷ��Լ�أ���Ҳ�Ǻ����һ�����о��ģ��Լ�����һ������ŷ�����棬��Ȼ���ڲ��Ի�����

----
����

��ͬѧָ���˻����ת�������⣬�����ҵĲ��Է���ȷʵ�Ǵ���һ�����⣬�����˻�֮��ת�˵�ʱ��Ĭ��ת�Ļ���web3.eth.defaultAccout �˻���token����û��ת����˽Կǩ�����˻���

����鿴web3.js ���ĵ����ĵ���web3.js ��Ӧ�İ汾��1.0����������ʹ�õĻ���0.x�汾�� ����1.0�汾��api ��֮ǰ�İ汾�仯�ǳ���

������ʹ��web3.js 1.x �İ汾����ʵ����һ�顣 �����û����ת����û������ġ��޸ĺ�Ĵ����Ѿ��ϴ���[GitHub](https://github.com/Rhain/testeth), �ο��ļ� `mfc2.html`��


���ǡ�����������ָ�����ĵ� x ƪ���¡�

> ������Ҹ���Ȥ������ҽ������ҵ�΢�źţ�**Wentasy**������ʱ�򵥽������Լ�����ע�����ԡ�����������ָ������ͬʱ�һ��������΢��Ⱥ������������ָ������BTW����Ц����ʦҲ���������ǵ�֪ʶ������ĩ�м��뷽ʽ��

> ��ͼ����: ? Preethi Kasireddy / Bitcoin, Ethereum, Blockchain, Tokens, ICOs / hackernoon.com

������������ָ����ͬ�� **֪ʶ����**����ά�����£���ӭ���롣BTW��**��Ц����ʦҲ������**��

![����������ָ��](https://i.imgur.com/pQxlDqF.jpg)

������������ָ���������Ѷ������

* ������������ָ����ͬ��֪ʶ����[https://t.xiaomiquan.com/ZRbmaU3](https://t.xiaomiquan.com/ZRbmaU3)
* ������[https://chainone.xyz](https://chainone.xyz)
* �ٷ����ͣ�[https://blog.chainone.xyz](https://blog.chainone.xyz)
* �ٷ�������[https://bcage.one](https://bcage.one)
* Telegram Channel��[https://t.me/BlockchainAge](https://t.me/BlockchainAge)
* Telegram Group��[https://t.me/bcage](https://t.me/bcage)
* Twitter��[https://twitter.com/bcageone](https://twitter.com/bcageone)
* ����΢����[https://weibo.com/BlockchainAge](https://weibo.com/BlockchainAge)

ͬʱ����ϵ�����»�����������ͬ�����£���ӭ��ע��

* ������������ָ����ͬ��΢�Ź��ںţ�΢�źţ�BlockchainAge��
* �ٷ����ͣ�[https://blog.chainone.xyz](https://blog.chainone.xyz)
* ֪����[https://zhuanlan.zhihu.com/robinwen](https://zhuanlan.zhihu.com/robinwen)
* Steemit��[https://steemit.com/@robinwen](https://steemit.com/@robinwen)
* Medium��[https://medium.com/@robinwan](https://medium.com/@robinwan)
* ���[robinwen@juejin.im](https://juejin.im/user/5673ccae60b2260ee435f89a/posts)
* �Һ���[https://bihu.com/people/12109](https://bihu.com/people/12109)

ԭ�����ף����߿���ͨ������;�����ͣ�������ҡ���Ԫ�����Ҿ�֧�֡�

* BTC: 1HRZ7og2KjqpP3v3jskgueNu64kJrFU8GD
* ERC20 Token: 0x5c8DEB48dC08b5dC60A0290B718690a801509Dd1
* PayPal: [https://www.paypal.me/robinwen](https://www.paypal.me/robinwen)
* ΢�Ŵ��Ͷ�ά��

![Imgur](https://i.imgur.com/JCMV4vL.jpg)

�CEOF�C

��Ȩ������[����ת��-������-������-�������������⹲��4.0���֤��](http://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh)