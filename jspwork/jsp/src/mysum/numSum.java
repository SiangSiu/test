package mysum;

public class numSum {
	private int num=0;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		int sum=0;
		for(int i=1; i<=num; i++){
			sum+=i;
		}
		
		this.num = sum;
	}
	
}
