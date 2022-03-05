/**
 * From https://github.com/facuspagnuolo/zeppelin-solidity/blob/c31ee54c9ae97c278a40d7206790934af0b279ce/contracts/math/SafeMath.sol
 */ 
pragma solidity ^0.8.0;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
contract SafeMath {

  /**
  * @dev Multiplies two unsigned integers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Multiplies two signed integers, throws on overflow.
  */
  function mul(int256 a, int256 b) internal pure returns (int256) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }
    int256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two unsigned integers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  * @dev Integer division of two signed integers, truncating the quotient.
  */
  function div(int256 a, int256 b) internal pure returns (int256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // int256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  * @dev Subtracts two unsigned integers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Subtracts two signed integers, throws on overflow.
  */
  function sub(int256 a, int256 b) internal pure returns (int256) {
    int256 c = a - b;
    assert((b >= 0 && c <= a) || (b < 0 && c > a));
    return c;
  }

  /**
  * @dev Adds two unsigned integers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }

  /**
  * @dev Adds two signed integers, throws on overflow.
  */
  function add(int256 a, int256 b) internal pure returns (int256) {
    int256 c = a + b;
    assert((b >= 0 && c >= a) || (b < 0 && c < a));
    return c;
  }
}