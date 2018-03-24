---
title: "��̫����token�̳�"
date: 2018-03-24 08:20:00
categories:
- Blockchain
tags:
- Blockchain
- ERC20
---

���ǡ�����������ָ�����ĵ� x ƪ���¡�

> ������Ҹ���Ȥ������ҽ������ҵ�΢�źţ�**Wentasy**������ʱ�򵥽������Լ�����ע�����ԡ�����������ָ������ͬʱ�һ��������΢��Ⱥ������������ָ������BTW����Ц����ʦҲ���������ǵ�֪ʶ������ĩ�м��뷽ʽ��

> ��ͼ����: ? Preethi Kasireddy / Bitcoin, Ethereum, Blockchain, Tokens, ICOs / hackernoon.com

2017������˷ǳ�������ֻ��ҡ��������ֻ�������β����ģ���Ϊһ������Ա�����ŶԷ��ҵĺ��棬�Լ����ְѷ��ҵ����̸�����һ�顣�ٴ˼�¼�¡����﷢����ָERC20 token��

### ׼������
�ڷ�Tokenǰ�����ȵ�ȷ��һ�¼��㣺
1. Token������
2. Token�ı�ʶ
3. Token��С��λ
4. Token������

�ҵ�ѡ���ǣ�

1. ���ƣ�MyFreeCoin
2. ��ʶ��MFC
3. С��λ�� 18
4. �������� 10000

С��λ��18λ����ʾMFC���Token��С���Ե� .0000000000000000001�� 

### Token����
��д MFC�����ܺ�Լ��
Token�ĺ�Լ�������ǲο�[Token-Factory](https://github.com/ConsenSys/Token-Factory/tree/master/contracts)�Ĵ��롣

```
pragma solidity ^0.4.4;

contract Token {

    /// @return ����token�ķ�����
    function totalSupply() constant returns (uint256 supply) {}

    /// @param _owner ��ѯ��̫����ַtoken���
    /// @return The balance �������
    function balanceOf(address _owner) constant returns (uint256 balance) {}

    /// @notice msg.sender�����׷����ߣ����� _value��һ���������� token �� _to�������ߣ�  
    /// @param _to �����ߵĵ�ַ
    /// @param _value ����token������
    /// @return �Ƿ�ɹ�
    function transfer(address _to, uint256 _value) returns (bool success) {}

    /// @notice ������ ���� _value��һ���������� token �� _to�������ߣ�  
    /// @param _from �����ߵĵ�ַ
    /// @param _to �����ߵĵ�ַ
    /// @param _value ���͵�����
    /// @return �Ƿ�ɹ�
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}

    /// @notice ���з� ��׼ һ����ַ����һ��������token
    /// @param _spender ��Ҫ����token�ĵ�ַ
    /// @param _value ����token������
    /// @return �Ƿ�ɹ�
    function approve(address _spender, uint256 _value) returns (bool success) {}

    /// @param _owner ӵ��token�ĵ�ַ
    /// @param _spender ���Է���token�ĵ�ַ
    /// @return �������͵�token������
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}

    /// ����Token�¼�
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    /// ��׼�¼�
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
```

```
/*
This implements ONLY the standard functions and NOTHING else.
For a token like you would want to deploy in something like Mist, see HumanStandardToken.sol.

If you deploy this, you won't have anything useful.

Implements ERC 20 Token standard: https://github.com/ethereum/EIPs/issues/20

ʵ��ERC20��׼
.*/

pragma solidity ^0.4.4;

import "./Token.sol";

contract StandardToken is Token {

    // ���ͽ��׷� תtoken�� �ĸ���ַ��
    function transfer(address _to, uint256 _value) returns (bool success) {
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }

    // ��һ����ַתtoken����һ����ַ
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } else { return false; }
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
```
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
    string public name;                   //token����: MyFreeCoin 
    uint8 public decimals;                //С��λ
    string public symbol;                 //��ʶ
    string public version = 'H0.1';       //�汾��

    function MyFreeCoin(
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
        ) {
        balances[msg.sender] = _initialAmount;               // ��Լ�����ߵ�����Ƿ�������
        totalSupply = _initialAmount;                        // ������
        name = _tokenName;                                   // token����
        decimals = _decimalUnits;                            // tokenС��λ
        symbol = _tokenSymbol;                               // token��ʶ
    }

    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}
```
�����Ҫ�����Լ���token��ֻ��Ҫ�� `MyFreeCoin`���ֵĵط��滻Ϊ���token���ơ�

��Ҫע���һ���ǣ��㷢�е�������Ҫ���tokenС���������á��������token��С������0������Ҫ����1000��token����ô����������ֵ1000���������token��С������18λ����Ҫ����1000��token����ô����������ֵ��1000000000000000000000��1000�������18��0����

`balances[msg.sender] = _initialAmount;  `
���д��룬���ǰѺ�Լ�ķ����ߵ��������Ϊ��������������

### ����Token
�ڲ��������Ϸ������ǵ�token��

1. ��װ[MetaMask](https://metamask.io/)Ǯ����
2. ��װMetaMask֮�󣬵�½Metamask�� ���Ͻ�ѡ��Ropsten������ͼ��
![Imgur](https://i.imgur.com/1HM1qLj.png)

����˺Ž��������ǵ����ܺ�Լ�������ߣ�Ҳ����˵token�����������Ǵ��뵽����˺š�
3. ��[Solidity Remix Compiler ](https://remix.ethereum.org/),remix ��һ�����߱��������԰����ǰ����ܺ�Լֱ�ӷ�������̫���ϡ�
4. �����������ļ����븴�Ƶ�remix�༭���С�������ɾ��remix��Ĭ��ballot.sol �ļ������½� Token.sol , StandardToken.sol, MyFreeCoin.sol �����ļ��� ��Ӧ�İѴ��븴�Ƶ��ļ��У�����ͼ��
![Imgur](https://i.imgur.com/G4TQbhr.png)
5.  ��� `start to compile` ��������ļ���
6. �����ǵĲ����˺������ eth�����ԣ�����ͼ��� buy��ť���ٵ��`ropsten test faucet`��
![Imgur](https://i.imgur.com/LYVs0cH.png)
![Imgur](https://i.imgur.com/Lf5HqBH.png)
7. ��� [faucet metamask](https://faucet.metamask.io/) ��վ�����
`request 1 eth from faucet`���ɹ�������� ���׼�¼��
![Imgur](https://i.imgur.com/KOAx5rv.png)
![Imgur](https://i.imgur.com/XwQLpc8.png)
8. ���Բ鿴�����ǵĲ����˻����Ѿ�����eth�������ˡ�
![Imgur](https://i.imgur.com/DyQLBuK.png)
9. ѡ��remix�е�run �˵�����������ѡ��MyFreeCoin, ��create��ť���������������� `"10000000000000000000000","MyFreeCoin",18,"MFC"`, ����ͼ
![Imgur](https://i.imgur.com/tsvbyWz.png)
��ͼ��ʱ��10000000000000000000000 û����˫�����������Ǵ���ģ���Ҫע����˫������������
10.  ���create ��ť����Ҫע����Ƿ�������Ҫ������ "" �С� metamask�ᵯ��ȷ�Ͽ�����ͼ��
![Imgur](https://i.imgur.com/cdUbsnq.png)
11. ȷ���󣬻�������״̬���ȴ��󹤴�����ס�
12. ��һ��ʱ��󣬽�����ɣ�����ʾMyFreeCoin ��Լ��
![Imgur](https://i.imgur.com/s4Ko0ii.png)
13. ���MyFreeCoin �ĸ��ư�ť�����ƺ�Լ��ַ�� [ropsten etherscan](https://ropsten.etherscan.io)�в�ѯ�����Բ�ѯ�����ǵĺ�Լ���������ͼ��
![Imgur](https://i.imgur.com/AcotJXf.png)
14. ��֤���Ƿ�����token����metamask��token�е�� add token ��ť������ͼ��
![Imgur](https://i.imgur.com/j3eVjRq.png)
15. ��add token �ĵ�ַ�������ǸղŸ��Ƶĺ�Լ��ַ������ͼ��
![Imgur](https://i.imgur.com/M3akjPS.png)
16. ������token�п��������´�����token������ͼ��
![Imgur](https://i.imgur.com/fayqUVM.png)
17. ��֤���ǵĺ�Լ���롣 �ڸղ�ropsten ethscan �ĺ�Լ��ַҳ���У����Contract code�� ����ͼ��
![Imgur](https://i.imgur.com/evRh8j7.png)
18. ���Verify and Publish�� ���������ҳ�棺
![Imgur](https://i.imgur.com/Hd2r0Xv.png)
19. ��`Contract name:` �����������token ����MyFreeCoin, Compiler ѡ����remix��sttings ��Solidity version ��ʾ�İ汾�š�Optimization ѡ�� No�� Ȼ����Enter the Solidity Contract Code below ������������������룬���ǵĴ����������ļ�����Ҫ�����Ǻϲ���һ���ļ����ϲ��ĸ�ʽ��������
```
pragma solidity ^0.4.4;
contract Token {
}
contract StandardToken is Token {
}
contract MyFreeCoin is StandardToken {
}

```
ȥ��ԭ�������ļ��е� import��䡣����ύ���ɹ��󣬻���ʾ�����ҳ���ʾ��֤�ɹ���
![Imgur](https://i.imgur.com/1oJ8sKH.png)

### ת��Token
����������ڲ�ͬ��ַ֮����ͨ���token�����ǵ�һ���˻��Ѿ���1000��MFC�ˡ�

���������ڴ���һ���µ��˻�������ͼ��
![Imgur](https://i.imgur.com/l8e1DHW.png)

���Կ��������´������˻� MFC��ֵ��0.
![Imgur](https://i.imgur.com/xNzm4SA.png)

���л����ǵĵ�һ���˻�����transfer ������ڶ��˻��ĵ�ַ��ת�������("0xe4da4CBC744708A6656BeD252f49DF5exxxxxxC97","1000000000000000000")������ͼ��
![Imgur](https://i.imgur.com/4roFpBF.png)

���transfer �ᵯ����������ȷ�������sumbit���ȴ����������л����ڶ����˻����鿴MFC�����Կ����Ѿ���ת������1MFC�ˡ�
![Imgur](https://i.imgur.com/N2j8XOa.png)

�������ǵķ�token�������Ѿ������ˡ������⻹ֻ�ǵ�һ�����������ǻ���Ҫ���򻯵�ִ��token�ĳ�ң���Ҳ�����Ҳ��һ��Ӧ����������token��������Ҫ�еĹ��ܡ����������о���ȥ��ʵ���ó���������Token��ת�á�

�ο����£�
> [how-to-create-your-own-ethereum-token-in-an-hour-erc20-verified](https://steemit.com/ethereum/@maxnachamkin/how-to-create-your-own-ethereum-token-in-an-hour-erc20-verified)

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




