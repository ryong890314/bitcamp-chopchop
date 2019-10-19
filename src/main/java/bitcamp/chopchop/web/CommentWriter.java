package bitcamp.chopchop.web;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import bitcamp.chopchop.domain.Comment;
import bitcamp.chopchop.domain.Product;

@Component
public class CommentWriter {
  public List<Comment> getComments(Product product) {

    List<Comment> comments = new ArrayList<>();

    Comment comment = new Comment();
    comment.setProductNo(product.getProductNo());

    return comments;
  }

}
