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

# Postorder (Left, Right, Root)
def postorder_traversal(root)
  # recurvice method
  postorder_traversal_rec(root)
  # iterative method
  # postorder_traversal_ite(root)
end

def postorder_traversal_rec(root)
  out ||= []
  inorder_traversal_helper(root, out)
end

def inorder_traversal_helper(root, out)
  if root && root.val
    if root.left
      inorder_traversal_helper(root.left, out)
    end
    if root.right
      inorder_traversal_helper(root.right, out)
    end
    out.push(root.val)
  end
  out
end

def postorder_traversal_ite(root)
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
      end

      # if left children was not present
      # and right children is present
      # remember it to traverse it in next iteration
      if root.right
        root_t = root.right
        root.right = nil
        all.push(root)
        root = root_t
        next
      end

      # if no children present
      # move last root value to output array
      if val.length > 0
        out.push(val.pop)
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
