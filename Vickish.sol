// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Vickish is ERC721Enumerable, Ownable {
    constructor(address initialOwner) ERC721("Vickish", "VVA") Ownable(initialOwner) {}

    function supportsInterface(bytes4 interfaceId) public view override returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return "https://api.example.com/token/";
    }

    function mint(address to) external onlyOwner {
        uint256 tokenId = totalSupply() + 1;
        _safeMint(to, tokenId);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(_baseURI(), tokenId));
    }
}
