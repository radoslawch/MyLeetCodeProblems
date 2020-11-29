# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#     @left = left
#     @right = right
#   end
# end
# @param {TreeNode} root
# @return {Integer[]}

# Inorder (Left, Root, Right)
def inorder_traversal(root)
  # recurvice method
  inorder_traversall_rec(root)
  # iterative method
  # inorder_traversall_ite(root)
end

def inorder_traversall_rec(root)
  out ||= []
  inorder_traversal_helper(root, out)
end

def inorder_traversal_helper(root, out)
  if root && root.val
    inorder_traversal_helper(root.left, out) if root.left
    out.push(root.val)
    inorder_traversal_helper(root.right, out) if root.right
  end
  out
end

def inorder_traversall_ite(root)
  # array of nodes to traverse
  all = []
  # array of root values
  val = []
  # output array
  out = []

  if root && root.val
    proceeding = true
    while proceeding

      # remember and clear current root value if present
      if root.val
        val.push(root.val)
        root.val = nil
      end

      # if left children is present
      # remember it to traverse it in next iteration
      # while remembering current node without it's left childern
      if root.left
        root_t = root.left
        root.left = nil
        all.push(root)
        root = root_t
        next
      # if left children is not present
      # move last root value to output array
      elsif val.length > 0
        out.push(val.pop)
      end

      # if left children was not present
      # and right children is present
      # remember it to traverse it in next iteration
      if root.right
        root = root.right
        next
      end

      # if no children were present
      # and root value array is empty
      # stop traversing
      proceeding = false if all.length == 0 && val.length == 0

      # if there is remembered node
      # traverse it next
      root = all.pop if all.length > 0
    end
  end
  out
end
