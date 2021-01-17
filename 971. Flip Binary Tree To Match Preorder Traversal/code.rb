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
# @param {Integer[]} voyage
# @return {Integer[]}
def flip_match_voyage(root, voyage)
  flip_match_voyage_helper(root, [], voyage)
rescue StandardError
  [-1]
end

def flip_match_voyage_helper(root, out, voyage)
  if root&.val && !voyage.empty?
    raise StandardError unless root.val == voyage.shift

    if root.left || root.right
      expected_value = voyage.first

      if (root.left&.val == expected_value) || (!root.left && root.right&.val == expected_value)
        flip_match_voyage_helper(root.left, out, voyage) if root.left
        flip_match_voyage_helper(root.right, out, voyage) if root.right
      elsif root.right&.val == expected_value
        out.push(root.val)
        flip_match_voyage_helper(root.right, out, voyage) if root.right
        flip_match_voyage_helper(root.left, out, voyage) if root.left
      else
        raise StandardError
      end
    end
  end
  out
end
