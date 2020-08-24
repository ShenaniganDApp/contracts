/*
  This file is part of Shenanigan.
  Shenanigan is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
  Shenanigan is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  You should have received a copy of the GNU General Public License
  along with Shenanigan. If not, see <http://www.gnu.org/licenses/>.
*/
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Card is ERC721 {
    address payable dao;

    event MintCard(address daoAddress);

    constructor(address payable _daoAddress) public {
        dao = _daoAddress;
        emit MintCard(_daoAddress);
    }

    function setDAOAddress(address _daoAddress) public {
        require(msg.sender == dao);
        dao = _daoAddress;
    }

     function safeTransferFrom(address from, address to, uint256 tokenId) public payable override {
        dao.transfer(msg.value);
        safeTransferFrom(from, to, tokenId, "");
    }
}
    
