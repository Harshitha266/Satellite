defmodule Satellite do
  @type tree :: {} | {tree, any, tree}

  @doc """
  Problem Statement:
    Build a binary tree from the given pre-order and in-order list

  Logic:

  1.The first element in the pre-order traversal represents the root node of the binary tree.
  2.Locate the index of the root node's value in the in-order traversal.
  3.Divide the in-order traversal into left and right subtrees:
  4.Elements to the left and right of the root node index in the in-order traversal represent the values in the left subtree and right subtree.

  5.Consider the number of elements in the left subtree from step 4.
   Elements from the second position of the pre-order traversal up to the number of elements in the left subtree correspond to the left subtree.
   Elements after the left subtree in the pre-order traversal correspond to the right subtree.
   Recursively build the left and right subtrees:

  Repeat steps 1-5 for both the left and right subtrees using the pre-order and in-order traversals obtained from step 5.
  Return the root node:

  The root node obtained from step 2, along with the recursively built left and right subtrees, forms the binary tree.

  """

  @spec build_tree(preorder :: [any], inorder :: [any]) :: {:ok, tree} | {:error, String.t()}
  def build_tree(preorder,inorder) do
    case validate_traversal_lists(preorder,inorder) do
      :ok -> build_binary_tree(preorder,inorder)
      e -> e
    end
  end
  defp build_binary_tree([], []), do: {}
  defp build_binary_tree([root|rest]=_preorder,inorder) do
    {left_inorder,[^root|right_inorder]} = Enum.split_while(inorder, &(&1 != root))
    right_preorder = rest -- left_inorder
    left_preorder = rest -- right_preorder
    {build_binary_tree(left_preorder, left_inorder), root, build_binary_tree(right_preorder, right_inorder)}
  end

  defp validate_traversal_lists([],[]), do: {:error,"lists cannot be empty"};
  defp validate_traversal_lists(preorder,inorder) do
    case length(Enum.uniq(preorder)) != length(Enum.uniq(inorder)) do
      true -> {:error, "Lists should contain unique elements and length of lists should be equal"}
      false -> :ok
    end
  end
end
