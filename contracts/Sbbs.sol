// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Sbbsi.sol";

contract Sbbs is Sbbsi {
    struct Post {
        address author;
        uint replyTo;
        uint time;

        string postData;
    }
    mapping(uint=>Post) private posts;

    uint nextPostID;

    constructor(string memory postData) {

        Post memory postZero;

        postZero.author = address(this);
        postZero.time = block.timestamp;
        postZero.postData = postData;
        postZero.replyTo = 0;

        uint postID = nextPostID++;
        posts[postID] = postZero;

        emit posted(address(this), address(0), postID, postData);
    }

    function getPostCount() external view returns (uint) {
        return nextPostID;
    }
    
    function getPost(uint postID) external view returns (
        address author, 
        uint replyTo, 
        uint time, 
        string memory postData
        ) {
        author = posts[postID].author;
        replyTo = posts[postID].replyTo;
        time = posts[postID].time;
        postData = posts[postID].postData;
    }

    function createPost(uint replyTo, string calldata postData) external returns (uint postID) {
        Post memory newPost;

        newPost.author = msg.sender;
        newPost.replyTo = replyTo;
        newPost.time = block.timestamp;
        newPost.postData = postData;

        postID = nextPostID++;
        posts[postID] = newPost;

        emit posted(msg.sender, posts[replyTo].author, postID, postData);
    }

}