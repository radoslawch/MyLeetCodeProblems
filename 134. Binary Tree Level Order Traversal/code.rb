# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  level_order_helper(root, [], 0)
end

def level_order_helper(root, out, level)
  if root&.val
    if out[level]
      out[level].push(root.val)
    else
      out[level] = [root.val]
    end
    level += 1
    level_order_helper(root.left, out, level) if root.left
    level_order_helper(root.right, out, level) if root.right
  end
  out
end
