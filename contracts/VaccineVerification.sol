pragma solidity >=0.4.22 <0.9.0;

contract VaccineVerification {
    address payable owner;
    mapping(address => string) public hashes;

    event fileHash(string returnedHash);

    constructor() public {
        owner = msg.sender;
    }

    function storeHash(string memory hash, address user) public {
        require(msg.sender == owner);
        hashes[user] = hash;
    }

    function getHash() public payable returns (string memory userHash) {
        require(
            msg.value == 1 ether,
            "You must pay one ether to access the hash."
        );
        owner.transfer(msg.value);
        return hashes[msg.sender];
        // emit fileHash(hashes[msg.sender]);
    }
}
