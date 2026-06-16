//SPDX License-Ietifier: MIT;
pragma solidity ^0.8.19;

//The project is about storing on chian skills dev learned with date, personal note, skill name and difficulty.

// Approach: use struct bcz of multiple data, 2nd approach is to use mapping of string and custom data type
// user should be able to add a skill and go thorugh skills either thorugh indexo or skill name, 
// I believe there should be option for both skill name and the index which we can.
contract skills{

    struct skill_info{
        string skill_name;
        uint id;
        uint difficulty;
        string personal_note;
    }
    mapping(string=>skill_info) public skillToDetails;
    mapping(uint=>skill_info) public idTODetails;
    uint _id = 1;


    function show1(string memory _skillName, uint _difficulty, string memory _personalNote) public virtual {
        skill_info memory NewSkill = skill_info(_skillName, _id, _difficulty, _personalNote);
        skillToDetails[_skillName] = NewSkill;
        idTODetails[_id] = NewSkill;
        _id=_id+1;
    }


}