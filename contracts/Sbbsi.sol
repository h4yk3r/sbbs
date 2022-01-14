// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface Sbbsi {
    // interface functions
    
    // returns number of posts stored
    function getPostCount() external view returns (uint);
    
    // get the data on given post ID
    function getPost(uint postID) external view returns (address, uint, uint, string memory);

    // create a new post
    function createPost(uint replyTo, string calldata postData) external returns (uint);

    //event
    event posted(address indexed author, address indexed replyToAddress, uint indexed postID, string postData);
}