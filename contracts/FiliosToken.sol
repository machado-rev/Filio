pragma solidity ^0.6.2;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';
import 'openzeppelin-solidity/contracts/access/Ownable.sol';

contract FiliosToken is ERC721, Ownable {
    
    constructor() ERC721 ("FiliosToken", "FIL") public {
    
}

  struct Filio {
    string outer;
    string inner;
  }

  Filio[] public filios;

  function getFilio( uint _filioId ) public view returns(string memory outer, string memory inner){
    Filio memory _grad = filios[_filioId];

    outer = _grad.outer;
    inner = _grad.inner;
  }

  function mint(string memory _outer, string memory _inner) public payable onlyOwner{
    Filio memory _filio = Filio({ outer: _outer, inner: _inner });
    filios.push(_filio);
    uint _filioId = filios.length - 1;
//    return _filioId;

    _mint(msg.sender, _filioId);
  }
}
