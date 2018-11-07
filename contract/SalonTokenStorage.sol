pragma solidity ^0.4.25;

import "./Administrative.sol";
import "./IExtendedERC20.sol";

contract SalonTokenStorage is IExtendedERC20, Administrative {
    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowed;

    //getters
    function getTotalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function getName() public view returns (string) {
        return _name;
    }

    function getSymbol() public view returns (string) {
        return _symbol;
    }

    function getDecimals() public view returns (uint8) {
        return _decimals;
    }

    function getBalances(address who) public view returns (uint256) {
        return _balances[who];
    }

    function getAllowed(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }


    //setters
    function setTotalSupply(uint256 value) public onlyPrivileged {
        _totalSupply = value;
    }

    function setName(string value) public onlyPrivileged {
        _name = value;
    }

    function setSymbol(string value) public onlyPrivileged {
        _symbol = value;
    }

    function setDecimals(uint8 value) public onlyPrivileged {
        _decimals = value;
    }

    function setBalances(address who, uint256 value) public onlyPrivileged {
        return _balances[who] = value;
    }

    function setAllowed(address owner, address spender, uint256 value) public onlyPrivileged {
        return _allowed[owner][spender] = value;
    }
}
