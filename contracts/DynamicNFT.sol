// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ImprovedDynamicNFT is ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;
    using Strings for uint256;

    // Base URI for metadata
    string private _baseTokenURI;

    // Mapping to store the music data associated with each token
    mapping(uint256 => string) private _musicData;

    // Counter for token IDs
    Counters.Counter private _tokenIdCounter;

    constructor(string memory name, string memory symbol, string memory baseTokenURI) ERC721(name, symbol) {
        _baseTokenURI = baseTokenURI;
    }

    // Set the base URI for metadata
    function setBaseURI(string memory baseTokenURI) external onlyOwner {
        _baseTokenURI = baseTokenURI;
    }

    // Mint a new NFT with associated music data
    function mintWithMusicData(address to, string memory musicData) external onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _mint(to, tokenId);
        _musicData[tokenId] = musicData;
        _tokenIdCounter.increment();
    }

    // Retrieve the music data associated with a token
    function getMusicData(uint256 tokenId) external view returns (string memory) {
        return _musicData[tokenId];
    }

    // Override _baseURI() to provide dynamic metadata URI
    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }
}
