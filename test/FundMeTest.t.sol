//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test,console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test{
    FundMe public fundMe;
    function setUp() external{
        DeployFundMe script = new DeployFundMe();
        fundMe = script.run();
    }

    function test_MinimumFund() public view{
        assertEq(fundMe.MINIMUM_USD(),5e18);
    }

    function test_Owner() public view{ 
        assertEq(fundMe.i_owner(),msg.sender);
    }

    function test_version() public view{
        assertEq(fundMe.getVersion(),4);
    }
}