pragma solidity ^0.5.0;

contract MedicalDataExchange {
    struct MedicalData {
        bytes32 dataHash;
        address owner;
        bool isShared;
    }

    mapping(bytes32 => MedicalData) public medicalData;

    event MedicalDataShared(bytes32 indexed dataHash, address indexed owner);
    event MedicalDataUnshared(bytes32 indexed dataHash, address indexed owner);

    function shareMedicalData(bytes32 _dataHash) public {
        require(medicalData[_dataHash].owner == msg.sender, "Only the owner of the medical data can share it.");
        medicalData[_dataHash].isShared = true;
        emit MedicalDataShared(_dataHash, msg.sender);
    }

    function unshareMedicalData(bytes32 _dataHash) public {
        require(medicalData[_dataHash].owner == msg.sender, "Only the owner of the medical data can unshare it.");
        medicalData[_dataHash].isShared = false;
        emit MedicalDataUnshared(_dataHash, msg.sender);
    }

    function isMedicalDataShared(bytes32 _dataHash) public view returns (bool) {
        return medicalData[_dataHash].isShared;
    }
}
