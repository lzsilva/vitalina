package entidade;

public class ObjetoDeTransporte {
	
	String nomeDaLinha;
	int ordem;
	
	public ObjetoDeTransporte(String nomeDaLinha, int ordem){
		this.nomeDaLinha = nomeDaLinha;
		this.ordem = ordem;		
	}
	
	public String getNomeDaLinha(){
		return nomeDaLinha;
	}
	
	public int getOrdem(){
		return ordem;
	}
	

}
