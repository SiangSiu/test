package MyStar;

public class Star {
	int num=0;
	public int getNum(){
		return this.num;
	}
	
	public void setNum(int num){
		this.num = num;
	}
	
	public void stars (){
		for(int i=0; i<this.num; i++){
			for(int j=0; j<=i;j++){
				System.out.print("*");
			}
			System.out.println();
		}

	}
	
	
}
