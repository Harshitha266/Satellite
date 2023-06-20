Getting Started:

To begin, follow these steps:

Download the "Satellite.ex" module and save it in your local directory.
Open an IEX shell in the same directory.
Compile the module by executing the command c("Satellite.ex").
Usage
To obtain the binary tree for a given preorder and inorder traversal, use the following function:

Satellite.build_tree(preorder, inorder)

Example:
Consider the following preorder and inorder traversals:

Preorder: [1, 2, 4, 5, 3, 6]

Inorder: [4, 2, 5, 1, 6, 3]

The expected output for the above traversals should be:

Binary Tree: {{{{}, 4, {}}, 2, {{}, 5, {}}}, 1, {{{}, 6, {}}, 3, {}}}

This represents the binary tree structure derived from the given preorder and inorder traversals.





