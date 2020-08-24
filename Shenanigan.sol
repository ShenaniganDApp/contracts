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
pragma solidity 0.6.0;
import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "./ShenaniganStorage.sol";

contract Shenanigan is Ownable, ShenaniganStorage {

    function toggleWagerStatus() public onlyOwner {
        wagerIsActive = !wagerIsActive;
        if(wagerIsFinished == true){
            msg.sender.transfer(donatedFunds);
        }
        emit WagerStatus(wagerIsActive);
    }

    function toggleVote() public onlyOwner {
        isOpen = !isOpen;
    }

    function getTotals() public view returns (uint256[] memory){
        return totalVotes;
    }
}