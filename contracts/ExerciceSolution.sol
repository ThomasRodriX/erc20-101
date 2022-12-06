pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is ERC20, IExerciceSolution
{
  constructor() public ERC20("ThomasR", "Js1ph"){
    //_mint(msg.sender, 203675900000000000000000000);
  }
  mapping(address => bool) public usersList;
  mapping(address => uint256) public userslvl;


  function symbol() public override(ERC20, IExerciceSolution) view returns (string memory){
    return "Js1ph";
  }

  function getToken() external override returns (bool){
    require(usersList[msg.sender]==true);
    _mint(msg.sender, 1);
    return true;
  }

  //function buyToken() external payable override returns (bool){
    //require(usersList[msg.sender]==true);
    //_mint(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5, msg.value);
    //require(userslvl[msg.sender] == 1);
    //_mint(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5, msg.value);
    //return true;
  //}

  function buyToken() external payable override returns (bool){
    require(usersList[msg.sender]==true);
    if(userslvl[msg.sender] == 1) {
      _mint(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5, msg.value);        
    }
    else if(userslvl[msg.sender] == 2) {
      _mint(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5, 2 * msg.value);
    }
    else {
      _mint(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5, 1);
    }
    return true;
  }

  function isCustomerWhiteListed(address customerAddress) external override returns (bool){
    usersList[customerAddress] = true;
    return true;
  }

  function customerTierLevel(address customerAddress) external override returns (uint256){
    userslvl[customerAddress] = 2;    
    return 2;
  }
}