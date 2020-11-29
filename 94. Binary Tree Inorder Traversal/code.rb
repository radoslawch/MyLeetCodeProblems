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
    if root.left
      inorder_traversal_helper(root.left, out)
    end
    out.push(root.val)
    if root.right
      inorder_traversal_helper(root.right, out)
    end
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
      if (all.length == 0 && val.length == 0)
        proceeding = false
      end

      # if there is remembered node
      # traverse it next
      if all.length > 0
        root = all.pop
      end
    end
  end
  out
end
