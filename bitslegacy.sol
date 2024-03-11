/**
 *Submitted for verification at Etherscan.io on 2023-11-24
*/

/**
 *Submitted for verification at testnet.bscscan.com on 2023-11-21
*/

/**
 *Submitted for verification at Etherscan.io on 2023-11-10
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId)
        external
        view
        returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

/**
 * @title ERC-721 Non-Fungible Token Standard, optional metadata extension
 * @dev See https://eips.ethereum.org/EIPS/eip-721
 */
interface IERC721Metadata is IERC721 {
    /**
     * @dev Returns the token collection name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the token collection symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     *
     * [IMPORTANT]
     * ====
     * You shouldn't rely on `isContract` to protect against flash loan attacks!
     *
     * Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
     * like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
     * constructor.
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize/address.code.length, which returns 0
        // for contracts in construction, since the code is only stored at the end
        // of the constructor execution.

        return account.code.length > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(
            address(this).balance >= amount,
            "Address: insufficient balance"
        );

        (bool success, ) = recipient.call{value: amount}("");
        require(
            success,
            "Address: unable to send value, recipient may have reverted"
        );
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return
            functionCallWithValue(
                target,
                data,
                value,
                "Address: low-level call with value failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(
            address(this).balance >= value,
            "Address: insufficient balance for call"
        );
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(
            data
        );
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data)
        internal
        view
        returns (bytes memory)
    {
        return
            functionStaticCall(
                target,
                data,
                "Address: low-level static call failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data)
        internal
        returns (bytes memory)
    {
        return
            functionDelegateCall(
                target,
                data,
                "Address: low-level delegate call failed"
            );
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Tool to verifies that a low level call was successful, and revert if it wasn't, either by bubbling the
     * revert reason using the provided one.
     *
     * _Available since v4.3._
     */
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

/**
 * @dev String operations.
 */
library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     */
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
    function toHexString(uint256 value, uint256 length)
        internal
        pure
        returns (string memory)
    {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 *
 * Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 */
abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return interfaceId == type(IERC165).interfaceId;
    }
}

/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {ERC721Enumerable}.
 */
contract ERC721 is Context, ERC165, IERC721, IERC721Metadata {
    using Address for address;
    using Strings for uint256;

    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Mapping from token ID to owner address
    mapping(uint256 => address) private _owners;

    // Mapping owner address to token count
    mapping(address => uint256) private _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    // Mapping from owner to operator approvals
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC165, IERC165)
        returns (bool)
    {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC721Metadata).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721-balanceOf}.
     */
    function balanceOf(address owner)
        public
        view
        virtual
        override
        returns (uint256)
    {
        require(
            owner != address(0),
            "ERC721: balance query for the zero address"
        );
        return _balances[owner];
    }

    /**
     * @dev See {IERC721-ownerOf}.
     */
    function ownerOf(uint256 tokenId)
        public
        view
        virtual
        override
        returns (address)
    {
        address owner = _owners[tokenId];
        require(
            owner != address(0),
            "ERC721: owner query for nonexistent token"
        );
        return owner;
    }

    /**
     * @dev See {IERC721Metadata-name}.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev See {IERC721Metadata-symbol}.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );
        require(msg.sender == ownerOf(tokenId),"only owner of this envelopeId can call this function");

        string memory baseURI = _baseURI();
        return
            bytes(baseURI).length > 0
                ? string(abi.encodePacked(baseURI, tokenId.toString()))
                : "";
    }

    /**
     * @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
     * token will be the concatenation of the `baseURI` and the `tokenId`. Empty
     * by default, can be overriden in child contracts.
     */
    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    /**
     * @dev See {IERC721-approve}.
     */
    function approve(address to, uint256 tokenId) public virtual override {
        address owner = ERC721.ownerOf(tokenId);
        require(to != owner, "ERC721: approval to current owner");

        require(
            _msgSender() == owner || isApprovedForAll(owner, _msgSender()),
            "ERC721: approve caller is not owner nor approved for all"
        );

        _approve(to, tokenId);
    }

    /**
     * @dev See {IERC721-getApproved}.
     */
    function getApproved(uint256 tokenId)
        public
        view
        virtual
        override
        returns (address)
    {
        require(
            _exists(tokenId),
            "ERC721: approved query for nonexistent token"
        );

        return _tokenApprovals[tokenId];
    }

    /**
     * @dev See {IERC721-setApprovalForAll}.
     */
    function setApprovalForAll(address operator, bool approved)
        public
        virtual
        override
    {
        _setApprovalForAll(_msgSender(), operator, approved);
    }

    /**
     * @dev See {IERC721-isApprovedForAll}.
     */
    function isApprovedForAll(address owner, address operator)
        public
        view
        virtual
        override
        returns (bool)
    {
        return _operatorApprovals[owner][operator];
    }

    /**
     * @dev See {IERC721-transferFrom}.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        //solhint-disable-next-line max-line-length
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: transfer caller is not owner nor approved"
        );

        _transfer(from, to, tokenId);
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        safeTransferFrom(from, to, tokenId, "");
    }

    /**
     * @dev See {IERC721-safeTransferFrom}.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: transfer caller is not owner nor approved"
        );
        _safeTransfer(from, to, tokenId, _data);
    }

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * `_data` is additional data, it has no specified format and it is sent in call to `to`.
     *
     * This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
     * implement alternative mechanisms to perform token transfer, such as signature-based.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _transfer(from, to, tokenId);
        require(
            _checkOnERC721Received(from, to, tokenId, _data),
            "ERC721: transfer to non ERC721Receiver implementer"
        );
    }

    /**
     * @dev Returns whether `tokenId` exists.
     *
     * Tokens can be managed by their owner or approved accounts via {approve} or {setApprovalForAll}.
     *
     * Tokens start existing when they are minted (`_mint`),
     * and stop existing when they are burned (`_burn`).
     */
    function _exists(uint256 tokenId) internal view virtual returns (bool) {
        return _owners[tokenId] != address(0);
    }

    /**
     * @dev Returns whether `spender` is allowed to manage `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _isApprovedOrOwner(address spender, uint256 tokenId)
        internal
        view
        virtual
        returns (bool)
    {
        require(
            _exists(tokenId),
            "ERC721: operator query for nonexistent token"
        );
        address owner = ERC721.ownerOf(tokenId);
        return (spender == owner ||
            getApproved(tokenId) == spender ||
            isApprovedForAll(owner, spender));
    }

    /**
     * @dev Safely mints `tokenId` and transfers it to `to`.
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function _safeMint(address to, uint256 tokenId) internal virtual {
        _safeMint(to, tokenId, "");
    }

    /**
     * @dev Same as {xref-ERC721-_safeMint-address-uint256-}[`_safeMint`], with an additional `data` parameter which is
     * forwarded in {IERC721Receiver-onERC721Received} to contract recipients.
     */
    function _safeMint(
        address to,
        uint256 tokenId,
        bytes memory _data
    ) internal virtual {
        _mint(to, tokenId);
        require(
            _checkOnERC721Received(address(0), to, tokenId, _data),
            "ERC721: transfer to non ERC721Receiver implementer"
        );
    }

    /**
     * @dev Mints `tokenId` and transfers it to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - `to` cannot be the zero address.
     *
     * Emits a {Transfer} event.
     */
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _beforeTokenTransfer(address(0), to, tokenId);

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);

        _afterTokenTransfer(address(0), to, tokenId);
    }

    /**
     * @dev Destroys `tokenId`.
     * The approval is cleared when the token is burned.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     *
     * Emits a {Transfer} event.
     */
    function _burn(uint256 tokenId) internal virtual {
        address owner = ERC721.ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId);

        // Clear approvals
        _approve(address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);

        _afterTokenTransfer(owner, address(0), tokenId);
    }

    /**
     * @dev Transfers `tokenId` from `from` to `to`.
     *  As opposed to {transferFrom}, this imposes no restrictions on msg.sender.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     *
     * Emits a {Transfer} event.
     */
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        require(
            ERC721.ownerOf(tokenId) == from,
            "ERC721: transfer from incorrect owner"
        );
        require(to != address(0), "ERC721: transfer to the zero address");

        _beforeTokenTransfer(from, to, tokenId);

        // Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);

        _afterTokenTransfer(from, to, tokenId);
    }

    /**
     * @dev Approve `to` to operate on `tokenId`
     *
     * Emits a {Approval} event.
     */
    function _approve(address to, uint256 tokenId) internal virtual {
        _tokenApprovals[tokenId] = to;
        emit Approval(ERC721.ownerOf(tokenId), to, tokenId);
    }

    /**
     * @dev Approve `operator` to operate on all of `owner` tokens
     *
     * Emits a {ApprovalForAll} event.
     */
    function _setApprovalForAll(
        address owner,
        address operator,
        bool approved
    ) internal virtual {
        require(owner != operator, "ERC721: approve to caller");
        _operatorApprovals[owner][operator] = approved;
        emit ApprovalForAll(owner, operator, approved);
    }

    /**
     * @dev Internal function to invoke {IERC721Receiver-onERC721Received} on a target address.
     * The call is not executed if the target address is not a contract.
     *
     * @param from address representing the previous owner of the given token ID
     * @param to target address that will receive the tokens
     * @param tokenId uint256 ID of the token to be transferred
     * @param _data bytes optional data to send along with the call
     * @return bool whether the call correctly returned the expected magic value
     */
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) private returns (bool) {
        if (to.isContract()) {
            try
                IERC721Receiver(to).onERC721Received(
                    _msgSender(),
                    from,
                    tokenId,
                    _data
                )
            returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert(
                        "ERC721: transfer to non ERC721Receiver implementer"
                    );
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    /**
     * @dev Hook that is called before any token transfer. This includes minting
     * and burning.
     *
     * Calling conditions:
     *
     * - When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
     * transferred to `to`.
     * - When `from` is zero, `tokenId` will be minted for `to`.
     * - When `to` is zero, ``from``'s `tokenId` will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {}
}

/**
 * @dev ERC721 token with storage based token URI management.
 */
abstract contract ERC721URIStorage is ERC721 {
    using Strings for uint256;

    // Optional mapping for token URIs
    mapping(uint256 => string) private _tokenURIs;


    /**
     * @dev Sets `_tokenURI` as the tokenURI of `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function _setTokenURI(uint256 tokenId, string memory _tokenURI)
        internal
        virtual
    {
        require(
            _exists(tokenId),
            "ERC721URIStorage: URI set of nonexistent token"
        );
        _tokenURIs[tokenId] = _tokenURI;
    }

    /**
     * @dev Destroys `tokenId`.
     * The approval is cleared when the token is burned.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     *
     * Emits a {Transfer} event.
     */
    function _burn(uint256 tokenId) internal virtual override {
        super._burn(tokenId);

        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }
}

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(
            newOwner != address(0),
            "Ownable: new owner is the zero address"
        );
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

contract DeadManSwitch is ERC721URIStorage, Ownable {

    uint256[] public NFTIDs;
    uint256 public time = 30 days;
    uint count = 0;

    struct Envelope {
        uint256 id;
        uint256 firstTrusteeCountdownDays;
        address firstTrustedUser;
        uint256 secondTrusteeCountdownDays;
        address secondTrustedUser;
        bool claimed;
        bool firstUserCountDownStarted;
        uint256 firstUserCountDownTime;
        uint256 secondCounterTime;
        bool secondUserCountdownStarted;
        uint256 secondUserCountDownTime;
        bool reset;

    }
    struct Envelope2 {
        uint256 id;
        string envelopeName;
        string creatorName;
        address creatorAddress;
        string ipfsHash;
        string firstTrusteName;
        string secondTrusteName;

    }
    struct User{
       address user;
       uint256 subscriptionDuration;
    }

User[] public allUsers;
User[] public currentUsers;

    struct SubscriptionPlan {
        uint256 subscriptionId;
        uint256 duration; // Duration in seconds
        uint256 fee; // Subscription fee in wei (BNB)
    }
    struct IdData {
        uint256[] id;
    }
    mapping(address => IdData) envelopOnAddress;
    mapping(uint256 => Envelope) private envelopes;
    mapping(uint256 => Envelope2) private envelopes2;
    mapping(address => SubscriptionPlan) public userSubscriptions;
    mapping(uint256 => bool) public envelopExistence;

    mapping(address => uint256[]) public envelopesForTrustee; // Mapping from trustee address to envelope IDs
    uint256 public envelopeCounter = 0; // Counter for generating unique envelope IDs
    uint256 public additionalDays = 60 days;

    // Subscription management
    mapping(address => uint256) public subscriptionExpiration; // Mapping of subscriber addresses to expiration timestamps
    mapping(uint256 => SubscriptionPlan) public subscriptionPlans; // Mapping of plan IDs to SubscriptionPlan struct
    uint256 public numPlans; // Number of subscription plans
    SubscriptionPlan[] public allSubscriptions;

    event SubscriptionPaid(address indexed user, uint256 amount);
    event SubscriptionRenewed(
        address indexed subscriber,
        uint256 newExpiration
    );
    event SubscriptionUpgraded(
        address indexed subscriber,
        uint256 newExpiration
    );
    event SubscriptionCanceled(address indexed subscriber);
    event SubscriptionPlanAdded(uint256 planId, uint256 duration, uint256 fee);
    event SubscriptionFeeUpdated(uint256 planId, uint256 fee);

    constructor() ERC721("DeadManSwitchNFT", "DMS") {}

    // Function to create a new envelope with countdown and trusted users
    function createEnvelope(
        string memory name,
        string memory ipfsHash,
        string memory creatorName,
        uint256 firstTrusteeCountdownDays,
        uint256 secondCounterDays,
        string memory firstTrusteName,
        address firstUser,
        string memory secondTrusteName,
        address secondUser
    ) external {
        // Validate that the user is a subscriber
        require(
            isSubscriber(msg.sender),
            "You must be a subscriber to create an envelope"
        );
          require(
            firstUser != secondUser ,
            "both truste should be different"
        );

        // Validate that the user is the owner of the NFT
        uint256 envelopeId = envelopeCounter;
        _mint(msg.sender, envelopeId);
        NFTIDs.push(envelopeId);
        envelopExistence[envelopeId] = true;
        _setTokenURI(envelopeId, ipfsHash);
        envelopOnAddress[msg.sender].id.push(envelopeId);

        // Create a new envelope and store it
        envelopes[envelopeId] = Envelope(
            envelopeId,
            firstTrusteeCountdownDays,
            firstUser,
            secondCounterDays,
            secondUser,
            false,
            false,
            0,
            0,
            false,
            0,
            false
        );
        // Create a new envelope and store it
        envelopes2[envelopeId] = Envelope2(
            envelopeId,
            name,
            creatorName,
            msg.sender,
            ipfsHash,
            firstTrusteName,
            secondTrusteName
        );
        envelopeCounter++;
        envelopesForTrustee[firstUser].push(envelopeId);
        if(secondUser != address(0)){
        envelopesForTrustee[secondUser].push(envelopeId);
       
        }
    }
    function getCurrentUsers() public view returns(User[] memory){
        return allUsers;
    } 


    function encode(string memory message, string memory sign)
        public
        pure
        returns (bytes memory)
    {
        bytes memory data = abi.encode(message, sign);
        return data;
    }

    function decode(bytes memory data)
        public
        pure
        returns (string memory message, string memory sign)
    {
        (message, sign) = abi.decode(data, (string, string));
    }

    function getEnvelopOnAddress(address _address)
        public
        view
        returns (uint256[] memory)
    {
        uint256[] memory data = new uint256[](
            envelopOnAddress[_address].id.length
        );
        for (uint256 i = 0; i < envelopOnAddress[_address].id.length; i++) {
            data[i] = envelopOnAddress[_address].id[i];
        }
        return data;
    }

    function subscribe(uint256 planId) external payable {

        require(planId < numPlans, "Invalid plan ID");
        uint256 currentExpiration = subscriptionExpiration[msg.sender];
        uint256 fee = subscriptionPlans[planId].fee;
        require(msg.value >= fee, "Incorrect subscription fee");
        // Store the user's subscription plan
        if (userSubscriptions[msg.sender].duration < subscriptionPlans[planId].duration) {
        userSubscriptions[msg.sender] = subscriptionPlans[planId];
         uint256 newExpiration = subscriptionPlans[planId].duration;
         uint256 newDuration = block.timestamp + newExpiration*time;
        subscriptionExpiration[msg.sender] = newDuration;
        emit SubscriptionRenewed(msg.sender, newExpiration);
    } else {
        require(
            block.timestamp >= currentExpiration,
            "Previous Subscription is not yet expired"
        );
        userSubscriptions[msg.sender] = subscriptionPlans[planId];
        uint256 newExpiration = subscriptionPlans[planId].duration;
        uint256 newDuration = block.timestamp + newExpiration*time;
        subscriptionExpiration[msg.sender] = newDuration;

        emit SubscriptionRenewed(msg.sender, newExpiration);
    }
      User memory user = User(msg.sender, subscriptionExpiration[msg.sender]);
      allUsers.push(user);
       
    }


    // Function to cancel the subscription
    function cancelSubscription() external {
        delete subscriptionExpiration[msg.sender];
        delete userSubscriptions[msg.sender];
        userSubscriptions[msg.sender].duration = 0;
        emit SubscriptionCanceled(msg.sender);
    }

    // Function to check if an address is a subscriber
    function isSubscriber(address _address) public view returns (bool) {
        return block.timestamp < subscriptionExpiration[_address];
    }

    // Function to retrieve envelope details
    function getEnvelope(uint256 envelopeId)
        external
        view
        returns (
            uint256 _id,
            uint256 _firstTrusteeCountdownDays,
            address _firstTrustedUser,
            uint256 _secondTrusteeCountdownDays,
            address _secondTrustedUser,
            bool _claimed,
            bool _firstUserCountDownStarted,
            uint256 _firstUserCountDownTime,
            uint256 _secondCounterTime,
            bool _secondUserCountDownStarted,
            uint256 _secondUserCountDownTime
        )
    {
        require(_exists(envelopeId), "Envelope does not exist");
        //    require(ownerOf(envelopeId) == msg.sender, "Only the owner of the NFT can access this data");

        Envelope storage envelope = envelopes[envelopeId];
        return (
            envelope.id,
            envelope.firstTrusteeCountdownDays,
            envelope.firstTrustedUser,
            envelope.secondTrusteeCountdownDays,
            envelope.secondTrustedUser,
            envelope.claimed,
            envelope.firstUserCountDownStarted,
            envelope.firstUserCountDownTime,
            envelope.secondCounterTime,
            envelope.secondUserCountdownStarted,
            envelope.secondUserCountDownTime

        );
    }

    function getEnvelope2(uint256 envelopeId)
        external
        view
        returns (
            uint256 id,
            string memory name,
            string memory creatorName,
            address creatorAddress,
            string memory ipfsHash,
            string memory firstTrusteName,
            string memory secondTrusteName
   
        )
    {
        require(_exists(envelopeId), "Envelope does not exist");
        //    require(ownerOf(envelopeId) == msg.sender, "Only the owner of the NFT can access this data");

        Envelope2 storage envelope = envelopes2[envelopeId];
        return (
            envelope.id,
            envelope.envelopeName,
            envelope.creatorName,
            envelope.creatorAddress,
            envelope.ipfsHash,
            envelope.firstTrusteName,
            envelope.secondTrusteName
        );
    }

    function getEnvelopesForTrustee(address trustee)
        external
        view
        returns (uint256[] memory)
    {
        return envelopesForTrustee[trustee];
    }


    // Function to reset the countdown by the envelope owner
    function resetCountdown(uint256 envelopeId) external {
        require(_exists(envelopeId), "Envelope does not exist");
        Envelope storage envelope = envelopes[envelopeId];
        require(_msgSender() == ownerOf(envelopeId), "only owner can reset the time");
        bool started = envelope.firstUserCountDownStarted;
        require(started, "first Trustee has not yet started countdown");
         require(block.timestamp<envelope.firstUserCountDownTime, "you cannot reset the time as first Trustee countdowntime has finished");
         envelope.firstUserCountDownTime = 0;
         envelope.firstUserCountDownStarted = false;

    }


    // Function to update the envelope's trusted users
    function updateTrustedUsers(
        uint256 envelopeId,
        address firstUser,
        address secondUser,
        string memory firstTrusteName,
        string memory secondTrusteName,
        string memory _ipfsHash,
        uint256 _firstTrusteeCountdownDays,
        uint256 _secondTrusteeCountdownDays
    ) external {
        require(_exists(envelopeId), "Envelope does not exist");
        Envelope storage envelope = envelopes[envelopeId];
        Envelope2 storage envelope2 = envelopes2[envelopeId];
        require(
            _msgSender() == ownerOf(envelopeId),
            "Only the envelope owner can update trusted users"
        );
   address previousFirstTrustee = envelope.firstTrustedUser;
   address previousSecondTrustee = envelope.secondTrustedUser;
   removeTrusteId(previousFirstTrustee, envelopeId);
   removeTrusteId(previousSecondTrustee, envelopeId);
        envelope.firstTrustedUser = firstUser;
        envelope.secondTrustedUser = secondUser;
        envelope2.firstTrusteName = firstTrusteName;
        envelope2.secondTrusteName = secondTrusteName;
        envelope2.ipfsHash = _ipfsHash;
        _setTokenURI(envelopeId, _ipfsHash);
        if(envelope.firstUserCountDownStarted == false){
        envelope.firstTrusteeCountdownDays = block.timestamp + _firstTrusteeCountdownDays;
        envelope.secondTrusteeCountdownDays = block.timestamp + _secondTrusteeCountdownDays;
        }
        envelopesForTrustee[firstUser].push(envelopeId);
         envelopesForTrustee[secondUser].push(envelopeId);
      

    }

    // Function to delete an envelope by the owner
    function deleteEnvelope(uint256 envelopeId) external {
        require(_exists(envelopeId), "Envelope does not exist");
        require(
            _msgSender() == ownerOf(envelopeId),
            "Only the envelope owner can delete the envelope"
        );

        address firstUser = envelopes[envelopeId].firstTrustedUser;
        address secondUser = envelopes[envelopeId].secondTrustedUser;

        delete envelopes[envelopeId];
        _burn(envelopeId);
        // Remove the envelope ID from the owner's array
        removeEnvelopId(_msgSender(), envelopeId);
        // Remove the envelope ID from the trustees' arrays
        removeTrusteId(firstUser, envelopeId);
        removeTrusteId(secondUser, envelopeId);

        // // Find the index of the envelope in the owner's array
        // uint256 indexToDelete = 0;
        // bool found = false;
        // uint256[] storage ownerEnvelopeIds = envelopOnAddress[_msgSender()].id;
        // for (uint256 i = 0; i < ownerEnvelopeIds.length; i++) {
        //     if (ownerEnvelopeIds[i] == envelopeId) {
        //         indexToDelete = i;
        //         found = true;
        //         break;
        //     }
        // }

        // // Remove the envelope ID from the owner's array and shift elements
        // if (found) {
        //     for (
        //         uint256 i = indexToDelete;
        //         i < ownerEnvelopeIds.length - 1;
        //         i++
        //     ) {
        //         ownerEnvelopeIds[i] = ownerEnvelopeIds[i + 1];
        //     }
        //    ownerEnvelopeIds.pop();
        // }
        envelopExistence[envelopeId] = false;
    }

    function removeTrusteId(address trustee, uint256 envelopeId) public {
        uint256[] storage trusteeEnvelopes = envelopesForTrustee[trustee];
        for (uint256 i = 0; i < trusteeEnvelopes.length; i++) {
            if (trusteeEnvelopes[i] == envelopeId) {
                // Swap the last element with the element to be removed and then shorten the array
                trusteeEnvelopes[i] = trusteeEnvelopes[
                    trusteeEnvelopes.length - 1
                ];
                trusteeEnvelopes.pop();
                break;
            }
        }
    }

    // Function to remove an ID from the user's array
    function removeEnvelopId(address user, uint256 envelopeId) public {
        uint256[] storage ids = envelopOnAddress[user].id;
        for (uint256 i = 0; i < ids.length; i++) {
            if (ids[i] == envelopeId) {
                // Swap with the last ID and then remove the last element
                ids[i] = ids[ids.length - 1];
                ids.pop();
                break;
            }
        }
    }
    function getallSubscriptionPlans() public view returns(SubscriptionPlan[] memory){
         SubscriptionPlan[] memory plansWithLatestFees = new SubscriptionPlan[](numPlans);

        for (uint256 i = 0; i < numPlans; i++) {
            plansWithLatestFees[i] = subscriptionPlans[i];
        }

        return plansWithLatestFees;
    }
    function addSubscriptionPlan(uint256 _duration, uint256 fee)
        external
        onlyOwner
    {
        require(_duration > 0 && fee > 0, "Invalid plan parameters");
       uint256 planId = numPlans++;
        subscriptionPlans[planId] = SubscriptionPlan(planId, _duration, fee);
        allSubscriptions.push(subscriptionPlans[planId]);
        emit SubscriptionPlanAdded(planId,_duration, fee);
    }
  
       function setSubscriptionFee(uint256 planId,uint256 newFee)
        external
        onlyOwner
    {
        require(newFee > 0, "Invalid fee amount");
        require(planId < numPlans, "Invalid plan ID");
        subscriptionPlans[planId].fee = newFee;
        emit SubscriptionFeeUpdated(planId, newFee);
    }
    function getCurrentTime() public view returns(uint256){
        return block.timestamp;
    }


    function getUserSubscriptionPlan(address user)
        external
        view
        returns (uint256)
    {
        SubscriptionPlan storage plan = userSubscriptions[user];
        require(plan.duration != 0, "User is not subscribed");

        // Find the plan index by comparing the duration and fee with the available plans
        for (uint256 i = 0; i < numPlans; i++) {
            if (
                subscriptionPlans[i].duration == plan.duration &&
                subscriptionPlans[i].fee == plan.fee
            ) {
                return i; // Return the plan index
            }
        }

        revert("Invalid subscription plan");
    }
    
  

     function claimOwnership(uint256 envelopeId) external {

        require(_exists(envelopeId), "Envelope does not exist");
        Envelope storage envelope = envelopes[envelopeId];
             Envelope2 storage envelopeDetails = envelopes2[envelopeId];
           address owner =  envelopeDetails.creatorAddress;
            uint256 timeInterval = subscriptionExpiration[owner];
            require(
            _msgSender() == envelope.firstTrustedUser ||
                _msgSender() == envelope.secondTrustedUser,
            "Only the first or second trusted user can claim the ownership"
        );
        require(!(envelope.claimed), "NFT ownership already claimed");

    
        if( _msgSender() == envelope.firstTrustedUser ){
        bool started = envelope.firstUserCountDownStarted;
        if(!started){
         envelope.firstUserCountDownStarted=true; 
         envelope.firstUserCountDownTime = block.timestamp + envelope.firstTrusteeCountdownDays;
         if(envelope.secondTrustedUser != address(0)){
          envelope.secondCounterTime =  envelope.firstUserCountDownTime + envelope.secondTrusteeCountdownDays;
         }
         
        }
        else{
        require(block.timestamp>envelope.firstUserCountDownTime,"wait for first countdown end time");
         if(envelope.secondTrustedUser != address(0)){
         require(block.timestamp < envelope.secondCounterTime,"second counter time ended!");
         }
       
          envelope.claimed = true;
         address sender=ownerOf(envelopeId);
          _transfer(sender, _msgSender(), envelopeId); 
        }
        }
        else if( _msgSender() == envelope.secondTrustedUser){

             require(envelope.firstUserCountDownStarted, "first trustee have not yet started countdown");
            require(block.timestamp>envelope.firstUserCountDownTime, "wait for first trustee countdown end time");
             require(block.timestamp > envelope.secondCounterTime, "wait for second countdown end time");
            bool started = envelope.secondUserCountdownStarted;
        if(!started){
            envelope.secondUserCountdownStarted = true;
         envelope.secondUserCountDownTime = block.timestamp + envelope.firstTrusteeCountdownDays;
        }
        else{
          require(block.timestamp > envelope.secondUserCountDownTime, "wait for countdown end time");


            require(block.timestamp< timeInterval + additionalDays, "you cannot claim file as owner subscription has finished and additional 2 months has passed");
            envelope.claimed = true; 
            address sender=ownerOf(envelopeId);
          _transfer(sender, _msgSender(), envelopeId); 
              
        }
        }
    }
    function getContractBalance() public view returns(uint256){
        return address(this).balance;
    }

    function withdrawFunds() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}