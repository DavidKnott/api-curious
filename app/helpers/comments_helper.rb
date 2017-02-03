module CommentsHelper
  def comments_tree_for(comments)
    comments.map do |comment|
      if comment
        render(comment) + (comment.comments ? content_tag(:div, comments_tree_for(comment.comments), class: "replies") : nil)
      end
    end.join.html_safe
  end
end