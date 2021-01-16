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
def zigzag_level_order(root)
  zigzag_level_order_helper(root, [], 0)
end

def zigzag_level_order_helper(root, out, level)
  if root&.val
    if out[level] && level.even?
      out[level].push(root.val)
    elsif out[level]
      out[level].unshift(root.val)
    else
      out[level] = [root.val]
    end
    level += 1
    zigzag_level_order_helper(root.left, out, level) if root.left
    zigzag_level_order_helper(root.right, out, level) if root.right
  end
  out
end
