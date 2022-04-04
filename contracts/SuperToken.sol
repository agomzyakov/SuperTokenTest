// SPDX-License-Identifier: GPL-3.0

// Set the appropriate version of the compiler 
pragma solidity >=0.7.0 <0.9.0;

// Use capped Token to limit maximum number of tokens
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
// Use Ownable contract to restrict the issuance of tokens to the owner
import "@openzeppelin/contracts/access/Ownable.sol";

/** 
* @author Matykin Vadim Alexandrovich
* @title This token is only for test
* @notice My first super duper Token 
*/
contract SuperToken is ERC20Capped, Ownable{
    /// @dev Sets max tokens count to 1 billion, {name} to SuperToken and {symbol} to MVA
    /// @notice Creation test smart contract by Vadim
    constructor() ERC20("SuperToken", "MVA") ERC20Capped(1000000000*10**18){
    }

    /**
    * @notice Assign one token to owner
    * @dev Creates one token and assigns it to owner, increasing the total supply. 
    * Requirements: Can only be called by the current owner.
    */
    function issueToken() public onlyOwner{
        // 10**18 needed because have by default 18 decimals after point
        _mint(owner(), 1*10**18);
    }
}