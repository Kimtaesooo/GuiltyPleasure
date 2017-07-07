package dao.quizmodule;

import java.util.ArrayList;
import java.util.Collections;

import dto.Quiz;

/**
 * ����� ���õ� �۾��� �ϴ�Ŭ����
 * */
public class CheckQuiz {
	Quiz quiz;
	int combo = 1;
	String answer = null;
	ArrayList<String> quizlist;
	public CheckQuiz() {
		super();
	}
	/**
	 * ������ ���⸦ ���� �ִ� Ŭ����
	 * @param Quiz ���ü
	 * @see Quiz ���� ������ �����ϴ� DTOŬ����
	 * */
	public void setQuizList(Quiz quiz){
		quizlist = new ArrayList();
		String answer = quiz.getQ_answer();
		quizlist.add(quiz.getQ_answer());
		quizlist.add(quiz.getQ_wa_a());
		quizlist.add(quiz.getQ_wa_b());
		quizlist.add(quiz.getQ_wa_c());
		Collections.shuffle(quizlist);
	}
	
	/**
	 * ������� ��ȯ�ϴ� Ŭ����
	 * @see setQuizList(Quiz)
	 * @return ArrayList ���� ���Ⱑ ���� ����Ʈ�� ��ȯ
	 * */
	public ArrayList getQuizList(){
		return quizlist;
	}
	
	/**
	 * ������ ��� ������ �´��� Ȯ���ϴ� �޼���
	 * */
	public void setQuizCheck(String select) {
		this.quiz = quiz;
	}

	public void setQuiz(Quiz quiz){
		this.quiz = quiz;
	}
	
	public Quiz getQuiz(){
		return this.quiz;
	}
	
}
