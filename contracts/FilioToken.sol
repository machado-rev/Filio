pragma solidity ^0.6.2;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract FilioToken is ERC721Token, Ownable {
  string public constant name = "FilioToken";
  string public constant symbol = "FIL";

  struct Filio {
    string outer;
    string inner;
  }

  Filio[] public filios;

  function getFilio( uint _filioId ) public view returns(string outer, string inner){
    Filio memory _grad = filios[_filioId];

    outer = _grad.outer;
    inner = _grad.inner;
  }

  function mint(string _outer, string _inner) public payable onlyOwner{
    Filio memory _filio = Filio({ outer: _outer, inner: _inner });
    uint _filioId = filios.push(_filio) - 1;

    _mint(msg.sender, _filioId);
  }
}
