public class CA2
{
  private int[][] cells;
  private int gen;
  
  public CA2(int[][] seed)
  {
    this.cells=seed;
    gen=0;
  }
  
  private int neighborSum(int i,int j)
  {
    assert(i>=1 && j>=1 && i<=cells.length-2 && j<=cells[0].length-2);
    return cells[i-1][j-1]+cells[i-1][j]+cells[i-1][j+1]+cells[i][j-1]
    +cells[i][j+1]+cells[i+1][j-1]+cells[i+1][j]+cells[i+1][j+1];
  }
   
   private int updateCell(int i, int j)
   {
     int state=cells[i][j];
     int sum=neighborSum(i,j);
     if(state==1) //cell is alive
     {
       if(sum>=4) return 0; //dies from overpopulation
       else if(sum<=1) return 0; //dies from loneliness
       else return 1; //stays alive
     }
     else //cell is dead
     {
       if(sum==3) return 1; //birth
       else return 0; //stays dead
     }
   }
   
   public void nextGen()
   {
     int[][] newcells=new int[cells.length][cells[0].length];
     for(int i=1;i<cells.length-1;i++) //ignore edges
     {
       for(int j=1;j<cells[i].length-1;j++)
       {
         newcells[i][j]=updateCell(i,j); //<>//
         //print(neighborSum(i,j));
       }
       //println();
     }
     this.cells=newcells;
     gen++;
   }
      
   public void printCells()
   {
     println("Generation :"+str(this.gen));
     for(int i=0;i<cells.length;i++)
     {
       String s=new String();
       for(int j=0;j<cells[i].length;j++)
       {
         s+=str(cells[i][j]);
       }
       println(s);
     }
     println();
   }
   
   
   public int getCell(int i,int j)
   {
     return this.cells[i][j];
   }
}

void setup()
{
  int[][] seed={{0,0,0,0,0},{0,0,1,0,0},{0,0,1,0,0},{0,0,1,0,0},{0,0,0,0,0}}; //spinner
  CA2 myCA=new CA2(seed);
  for(int i=0;i<5;i++)
  {
    myCA.printCells();
    myCA.nextGen();
  }
  
}