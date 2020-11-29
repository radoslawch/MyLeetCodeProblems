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

# Preorder (Root, Left, Right)
def preorder_traversal(root)
  # recurvice method
  preorder_traversal_rec(root)
  # iterative method
  # preorder_traversal_ite(root)
end

def preorder_traversal_rec(root)
  out ||= []
  preorder_traversal_helper(root, out)
end

def preorder_traversal_helper(root, out)
  if root && root.val
    out.push(root.val)
    if root.left
      preorder_traversal_helper(root.left, out)
    end
    if root.right
      preorder_traversal_helper(root.right, out)
    end
  end
  out
end

def preorder_traversal_ite(root)
  # array of nodes to traverse
  all = []
  # output array
  out = []
  if root && root.val
    proceeding = true

    # firstly take root value
    out.push(root.val)

    while proceeding
      # then take left values
      # and lastly take right values
      all.push(root.right) if root.right
      all.push(root.left) if root.left

      # finish proceeding when no nodes left
      if all.length == 0
        proceeding = false
      end

      # take most recent left/right value
      root = all.pop
      # if there was no left/right value
      # take root value
      root ? out.push(root.val) : nil
    end
  end
  out
end
