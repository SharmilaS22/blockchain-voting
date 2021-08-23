pragma solidity ^0.6.6;

contract Voting {
    
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    
    mapping (uint => Candidate) public candidates;
    uint candidateCount = 0;
    
    mapping (address => bool) public citizens;
    
    constructor () public {
        
        addCandidate('Sharmi');
        addCandidate('Rits');
        addCandidate('Sammy');
        
    }
    
    function addCandidate(string memory _name) private {
        
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }
    
    function vote(uint _candidateId) public {
        
        require(!citizens[msg.sender]);
        
        candidates[_candidateId].voteCount ++;
        
        citizens[msg.sender] = true;
    }
}