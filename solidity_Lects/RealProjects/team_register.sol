//SPDX License-Identifier: MIT;
pragma solidity ^0.8.19;

// Project: build a hackathon team reputation system where the team register itself and whenever the taks is completed by a team member
// the reputation score of the team should get increase and also how many task a team has completed should also be counted 
// then in a extended contract add a elite team condiotion, where a team completed more than 10 task will come under elite team 

// Approach: use mapping, use struct, team should be accessible through its name

contract regularTeam{

    struct team_info{
        string Team_Name;
        uint Number_Of_Members;
    }

    struct task_info{
        string Team_Name;
        string task_name;
        string member_name;
        uint task_count;
        uint Team_Reputation;
    }

    mapping(string => team_info) public NameToTeam;
    mapping(string=> task_info) public NameToTask;
    // uint task_count = 1;
    // uint Team_Reputation = 0;


    function team_register(string memory tName, uint NuMem) public {
        team_info memory NewTeam = team_info(tName, NuMem);
        NameToTeam[tName] = NewTeam;
    }
    
    function task_register(string memory tName, string memory TaskName, string memory memName) public{
        
        NameToTask[tName].task_count++;
        NameToTask[tName].Team_Reputation = NameToTask[tName].Team_Reputation + 10;  // this is being done to have seperate score for each time 

        task_info memory NewTask = task_info(tName, TaskName, memName, NameToTask[tName].task_count, NameToTask[tName].Team_Reputation);
        NameToTask[tName] = NewTask;

    }

}