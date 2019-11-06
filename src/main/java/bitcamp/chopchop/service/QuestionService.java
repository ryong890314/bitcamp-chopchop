package bitcamp.chopchop.service;

import java.util.List;
import bitcamp.chopchop.domain.Question;

public interface QuestionService {
  List<Question> list() throws Exception;
  void insert(Question question) throws Exception;
  Question get(int no) throws Exception;
  void update(Question question) throws Exception;
  void delete(int no) throws Exception;
}
