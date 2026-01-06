# Simple-Voting-system
So actually here ownership logic works as contract deployed first stiing the owner using constructor inside the `constructor()`, which runs only once upon deployment, we set `owner = msg.sender`.
This captures the wallet address of the person who deployed the contract and stores it in the state variable `owner`.
To restrict access there is `setVotingStatus` function contains a requirement check:
` require(msg.sender == owner, "Only admin can do this.");`
This ensures that if anyone other than the original deployer tries to open or close voting, the transaction will fail.
