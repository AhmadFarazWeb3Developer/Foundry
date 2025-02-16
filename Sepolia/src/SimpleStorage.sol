// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    // Struct to store a person's details
    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    // 1. Static way to create a Person
    // Person public person1 =
    //     Person({favoriteNumber: 215154, name: "Ahmad Faraz"});

    // 2. Dynamic way to create a single person at a time
    // Person public person2;
    // function createPerson(string calldata _name, uint256 _favoriteNumber) public {
    //     person2.favoriteNumber = _favoriteNumber;
    //     person2.name = _name;
    // }

    // 3. Dynamic array to store multiple Person structs

    Person[] public people;

    function addPerson(
        string calldata _name,
        uint256 _favoriteNumber
    ) public virtual {
        // Person memory newPerson = Person(_name, _favoriteNumber); // one way to do
        // people.push(newPerson);
        // Optimized approach
        people.push(Person(_name, _favoriteNumber));
    }

    function listOfPeoples() public view returns (Person[] memory) {
        return people;
    }

    function getPerson(
        uint256 index
    ) public view returns (string memory, uint256) {
        // return (people[index].name, people[index].favoriteNumber); // // Expensive: Copies entire struct into memory
        Person storage person = people[index];
        return (person.name, person.favoriteNumber);
    }
}

contract storageFactroy {
    //     SimpleStorage public simpleStorage =new SimpleStorage(); // This is one time deployment and the address remains same

    SimpleStorage public simpleStorage; // this is dynamic each time the function call create a new instance of the contract

    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }
}
