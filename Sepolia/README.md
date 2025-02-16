# **Foundry Smart Contract Deployment & Interaction Guide**

This guide provides essential commands for deploying, broadcasting, and interacting with a Solidity smart contract using **Foundry**.

---

## **1️⃣ Run the Script in Simulation Mode**  

To execute the deployment script **without signing or broadcasting** (dry run):  

```sh
forge script script/DeploySimpleStorage.s.sol --rpc-url $ANVIL_RPC_URL --private-key $PRIVATE_KEY
```

---

## **2️⃣ Broadcast the Deployment Script to the Blockchain**  

To deploy the contract to the blockchain and **broadcast the transaction**:  

```sh
forge script script/DeploySimpleStorage.s.sol --rpc-url $ANVIL_RPC_URL --broadcast --private-key $PRIVATE_KEY
```

---

## **3️⃣ Add a New Entry to the Contract**  

To add a new person (`name`, `age`) to the contract’s storage:  

```sh
cast send 0x9fe46736679d2d9a65f0992f2272de9f3c7fa6e0 "addPerson(string,uint256)" "Nadar Shah" 225156  --rpc-url $ANVIL_RPC_URL --private-key $PRIVATE_KEY
```

---

## **4️⃣ Read the Contract Data (Array of Structs)**  

To fetch the list of people stored in the contract:  

```sh
cast call 0x9fe46736679d2d9a65f0992f2272de9f3c7fa6e0 "listOfPeoples()((string,uint256)[])"
```

---

### ✅ **Notes:**  

- Replace `0x9fe46736679d2d9a65f0992f2272de9f3c7fa6e0` with your actual deployed contract address.  
- Ensure your RPC URL (`$ANVIL_RPC_URL`) and **private key** (`$PRIVATE_KEY`) are correctly set in your environment.  

This guide ensures smooth interaction with your smart contract using **Foundry**. 🚀
