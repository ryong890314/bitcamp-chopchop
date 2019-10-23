package bitcamp.chopchop.dao;

import java.util.List;
import bitcamp.chopchop.domain.Comment;

public interface CommentDao {
  int insert(Comment comment) throws Exception;
  List<Comment> findAll() throws Exception;
  Comment findBy(int no) throws Exception;
  Comment findByProductWith(int no) throws Exception;
  int update(Comment comment) throws Exception;
  int deleteAll(int no) throws Exception;
  int commentDelete(int no) throws Exception;
}
