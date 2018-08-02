pragma solidity ^0.4.0;

contract TokenERC20 {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;
    mapping (address => uint256) public balanceOf;

    event Transfer(address from, address to, uint256 value);

    function TokenERC20(uint256 initialSupply, string tokenName, string tokenSymbol) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        name = tokenName;
        symbol = tokenSymbol;
        balanceOf[msg.sender] = totalSupply;
    }

    function _transfer(address _from, address _to, uint _value) internal {
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }


}

interface TokenERC20Interface {
    function transfer(address _to, uint256 _value) public;

}

contract BasicContract {

    function transferToken() public {
        TokenERC20Interface token = TokenERC20Interface(0x5e72914535f202659083db3a02c984188fa26e9f);
        token.transfer(0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db, 1);
    }
}
