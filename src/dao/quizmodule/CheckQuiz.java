package dao.quizmodule;

import dto.Quiz;

public class CheckQuiz {
	Quiz quiz;
	int combo = 0;
	String answer = null;

	public CheckQuiz() {
		super();
	}

	//�������� ������ ������ �����´�. ����ڰ� ������ ���⺸�� ���� ����Ǿ���Ѵ�.
	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	//�̿��ڰ� ������ ������ ���⸦ String���� �����´�. �׸��� ���⼭ Ȯ��
	public void setAnswer(String answer) {
		this.answer = answer;
		if(quiz.getQ_answer().equals(answer)){
			this.combo++;
		}else{
			this.combo = 0;
		}
	}

	//�޺�ȭ�鿡 �ѷ��� combo�� �����Ѵ�.
	public int getCombo() {
		return combo;
	}
	
	
	
	
}
