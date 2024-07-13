// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract AuctionContract {
    address public owner;
    uint256 public highestBid;
    mapping(address => uint256) public bids;
    bool public auctionEnded;

    // Event emitted when a new bid is placed
    event NewBid(address bidder, uint256 amount);

    // Event emitted when the auction is ended
    event AuctionEnded(address winner, uint256 highestBid);

    // Modifier to check if the auction has ended
    modifier onlyBeforeAuctionEnd {
        require(!auctionEnded, "Auction has already ended");
        _;
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Constructor to set the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to place a bid
    function placeBid(uint256 _amount) public onlyBeforeAuctionEnd {
        // Require the bid to be higher than the current highest bid
        require(_amount > highestBid, "Bid must be higher than the current highest bid");

        // Update the highest bid and bidder
        highestBid = _amount;
        bids[msg.sender] = _amount;

        // Emit the NewBid event
        emit NewBid(msg.sender, _amount);
    }

    // Function to end the auction
    function endAuction() public onlyOwner {
        // Require the auction to not have ended already
        require(!auctionEnded, "Auction has already ended");

        // Set the auction ended flag to true
        auctionEnded = true;

        // Emit the AuctionEnded event
        emit AuctionEnded(owner, highestBid);
    }

    // Function to demonstrate assert statement
    function assertExample(uint256 _value) public pure returns (uint256) {
        // Assert that the value is a multiple of 3
        assert(_value % 3 == 0);
        return _value;
    }

    // Function to demonstrate revert statement
    function revertExample(uint256 _value) public pure returns (uint256) {
        // Revert if the value is zero
        if (_value == 0) {
            revert("Value cannot be zero");
        }
        return _value;
    }

    // Function to demonstrate custom error
    error InvalidBidder(address bidder);

    function getBidderBid(address _bidder) public view returns (uint256) {
        uint256 bid = bids[_bidder];
        if (bid == 0) {
            revert InvalidBidder(_bidder);
        }
        return bid;
    }
}
