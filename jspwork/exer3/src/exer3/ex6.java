package exer3;

public class ex6 {
	private int sum=0;
	
	public int getSum () {
		
		return sum;
	}
	
	public void setSum (int sum) {
		for(int i = 1; i<=sum; i++){
			this.sum +=i;
		}
	}

}
